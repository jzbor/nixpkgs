{
  stdenv,
  lib,
  fetchurl,
  makeWrapper,
  xar,
  cpio,
  callPackage,
  nixosTests,
  buildFHSEnv,

  # Support pulseaudio by default
  pulseaudioSupport ? true,

  # Whether to support XDG portals at all
  xdgDesktopPortalSupport ? (
    plasma6XdgDesktopPortalSupport
    || plasma5XdgDesktopPortalSupport
    || lxqtXdgDesktopPortalSupport
    || gnomeXdgDesktopPortalSupport
    || hyprlandXdgDesktopPortalSupport
    || wlrXdgDesktopPortalSupport
    || xappXdgDesktopPortalSupport
  ),

  # This is Plasma 6 (KDE) XDG portal support
  plasma6XdgDesktopPortalSupport ? false,

  # This is Plasma 5 (KDE) XDG portal support
  plasma5XdgDesktopPortalSupport ? false,

  # This is LXQT XDG portal support
  lxqtXdgDesktopPortalSupport ? false,

  # This is GNOME XDG portal support
  gnomeXdgDesktopPortalSupport ? false,

  # This is Hyprland XDG portal support
  hyprlandXdgDesktopPortalSupport ? false,

  # This is `wlroots` XDG portal support
  wlrXdgDesktopPortalSupport ? false,

  # This is Xapp XDG portal support, used for GTK and various Cinnamon/MATE/Xfce4 infrastructure.
  xappXdgDesktopPortalSupport ? false,

  # This function can be overridden to add in extra packages
  targetPkgs ? pkgs: [ ],

  # This list can be overridden to add in extra packages
  # that are independent of the underlying package attrset
  targetPkgsFixed ? [ ],

}:

let
  inherit (stdenv.hostPlatform) system;
  throwSystem = throw "Unsupported system: ${system}";

  # Zoom versions are released at different times for each platform
  # and often with different versions. We write them on three lines
  # like this (rather than using {}) so that the updater script can
  # find where to edit them.
  versions.aarch64-darwin = "6.5.3.58803";
  versions.x86_64-darwin = "6.5.3.58803";
  versions.x86_64-linux = "6.5.3.2773";

  srcs = {
    aarch64-darwin = fetchurl {
      url = "https://zoom.us/client/${versions.aarch64-darwin}/zoomusInstallerFull.pkg?archType=arm64";
      name = "zoomusInstallerFull.pkg";
      hash = "sha256-Cwr4xshh3PJ3Vi4tH60/qeAp9OsvqdGkoj8Fwe88K/0=";
    };
    x86_64-darwin = fetchurl {
      url = "https://zoom.us/client/${versions.x86_64-darwin}/zoomusInstallerFull.pkg";
      hash = "sha256-45N/IhJpxZrxGVvqNWJC6ZiC6B3Srjd1Ucqxx+mc6eE=";
    };
    x86_64-linux = fetchurl {
      url = "https://zoom.us/client/${versions.x86_64-linux}/zoom_x86_64.pkg.tar.xz";
      hash = "sha256-laZg8uAo4KhgntYetAZGoGp0QPkK9EXPQh6kJ6VEkgE=";
    };
  };

  unpacked = stdenv.mkDerivation {
    pname = "zoom";
    version = versions.${system} or throwSystem;

    src = srcs.${system} or throwSystem;

    dontUnpack = stdenv.hostPlatform.isLinux;
    unpackPhase = lib.optionalString stdenv.hostPlatform.isDarwin ''
      xar -xf $src
      zcat < zoomus.pkg/Payload | cpio -i
    '';

    # Note: In order to uncover missing libraries
    # on x86_64-linux, add "pkgs" to this file's arguments
    # (at the top of this file), then add these attributes here:
    # > buildInputs = linuxGetDependencies pkgs;
    # > dontAutoPatchelf = true;
    # > dontWrapQtApps = true;
    # > preFixup = ''
    # >   addAutoPatchelfSearchPath $out/opt/zoom
    # >   autoPatchelf $out/opt/zoom/{cef,Qt,*.so*,aomhost,zoom,zopen,ZoomLauncher,ZoomWebviewHost}
    # > '';
    # ...and finally "pkgs.autoPatchelfHook"
    # to `nativeBuildInputs` right below.
    # Then build `zoom-us.unpacked`:
    # `autoPatchelfHook` will report missing library files.
    nativeBuildInputs = lib.optionals stdenv.hostPlatform.isDarwin [
      makeWrapper
      xar
      cpio
    ];

    installPhase = ''
      runHook preInstall
      ${
        rec {
          aarch64-darwin = ''
            mkdir -p $out/Applications
            cp -R zoom.us.app $out/Applications/
          '';
          # darwin steps same on both architectures
          x86_64-darwin = aarch64-darwin;
          x86_64-linux = ''
            mkdir $out
            tar -C $out -xf $src
            mv $out/usr/* $out/
          '';
        }
        .${system} or throwSystem
      }
      runHook postInstall
    '';

    postFixup = lib.optionalString stdenv.hostPlatform.isDarwin ''
      makeWrapper $out/Applications/zoom.us.app/Contents/MacOS/zoom.us $out/bin/zoom
    '';

    dontPatchELF = true;

    passthru.updateScript = ./update.sh;
    passthru.tests.startwindow = callPackage ./test.nix { };
    passthru.tests.nixos-module = nixosTests.zoom-us;

    meta = {
      homepage = "https://zoom.us/";
      changelog = "https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0061222";
      description = "zoom.us video conferencing application";
      sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
      license = lib.licenses.unfree;
      platforms = builtins.attrNames srcs;
      maintainers = with lib.maintainers; [
        philiptaron
        ryan4yin
        yarny
      ];
      mainProgram = "zoom";
    };
  };
  packages.aarch64-darwin = unpacked;
  packages.x86_64-darwin = unpacked;

  # linux definitions

  linuxGetDependencies =
    pkgs:
    [
      pkgs.alsa-lib
      pkgs.at-spi2-atk
      pkgs.at-spi2-core
      pkgs.atk
      pkgs.cairo
      pkgs.coreutils
      pkgs.cups
      pkgs.dbus
      pkgs.expat
      pkgs.fontconfig
      pkgs.freetype
      pkgs.gdk-pixbuf
      pkgs.glib
      pkgs.glib.dev
      pkgs.gtk3
      pkgs.libGL
      pkgs.libdrm
      pkgs.libgbm
      pkgs.libkrb5
      pkgs.libxkbcommon
      pkgs.nspr
      pkgs.nss
      pkgs.pango
      pkgs.pciutils
      pkgs.pipewire
      pkgs.procps
      pkgs.qt5.qt3d
      pkgs.qt5.qtgamepad
      pkgs.qt5.qtlottie
      pkgs.qt5.qtmultimedia
      pkgs.qt5.qtremoteobjects
      pkgs.qt5.qtxmlpatterns
      pkgs.stdenv.cc.cc
      pkgs.udev
      pkgs.util-linux
      pkgs.wayland
      pkgs.xorg.libX11
      pkgs.xorg.libXcomposite
      pkgs.xorg.libXdamage
      pkgs.xorg.libXext
      pkgs.xorg.libXfixes
      pkgs.xorg.libXrandr
      pkgs.xorg.libXrender
      pkgs.xorg.libXtst
      pkgs.xorg.libxcb
      pkgs.xorg.libxshmfence
      pkgs.xorg.xcbutilimage
      pkgs.xorg.xcbutilkeysyms
      pkgs.xorg.xcbutilrenderutil
      pkgs.xorg.xcbutilwm
      pkgs.zlib
    ]
    ++ lib.optionals pulseaudioSupport [
      pkgs.libpulseaudio
      pkgs.pulseaudio
    ]
    ++ lib.optional xdgDesktopPortalSupport pkgs.xdg-desktop-portal
    ++ lib.optional plasma6XdgDesktopPortalSupport pkgs.kdePackages.xdg-desktop-portal-kde
    ++ lib.optional plasma5XdgDesktopPortalSupport pkgs.plasma5Packages.xdg-desktop-portal-kde
    ++ lib.optional lxqtXdgDesktopPortalSupport pkgs.lxqt.xdg-desktop-portal-lxqt
    ++ lib.optionals gnomeXdgDesktopPortalSupport [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ]
    ++ lib.optional hyprlandXdgDesktopPortalSupport pkgs.xdg-desktop-portal-hyprland
    ++ lib.optional wlrXdgDesktopPortalSupport pkgs.xdg-desktop-portal-wlr
    ++ lib.optional xappXdgDesktopPortalSupport pkgs.xdg-desktop-portal-xapp
    ++ targetPkgs pkgs
    ++ targetPkgsFixed;

  # We add the `unpacked` zoom archive to the FHS env
  # and also bind-mount its `/opt` directory.
  # This should assist Zoom in finding all its
  # files in the places where it expects them to be.
  packages.x86_64-linux = buildFHSEnv {
    pname = "zoom"; # Will also be the program's name!
    version = versions.${system} or throwSystem;

    targetPkgs = pkgs: (linuxGetDependencies pkgs) ++ [ unpacked ];
    extraBwrapArgs = [ "--ro-bind ${unpacked}/opt /opt" ];
    runScript = "/opt/zoom/ZoomLauncher";

    extraInstallCommands = ''
      cp -Rt $out/ ${unpacked}/share
      substituteInPlace \
          $out/share/applications/Zoom.desktop \
          --replace-fail Exec={/usr/bin/,}zoom

      # Backwards compatibility: we used to call it zoom-us
      ln -s $out/bin/{zoom,zoom-us}
    '';

    passthru = unpacked.passthru // {
      inherit unpacked;
    };
    inherit (unpacked) meta;
  };

in

packages.${system} or throwSystem

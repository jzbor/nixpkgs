# NOTE: Check the following URLs for support matrices:
#       v8 -> https://docs.nvidia.com/deeplearning/cudnn/archives/index.html
#       v9 -> https://docs.nvidia.com/deeplearning/cudnn/frontend/latest/reference/support-matrix.html
# Version policy is to keep the latest minor release for each major release.
#             https://developer.download.nvidia.com/compute/cudnn/redist/
{
  cudnn.releases = {
    # jetson
    linux-aarch64 = [
      {
        version = "8.9.5.30";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-aarch64/cudnn-linux-aarch64-8.9.5.30_cuda12-archive.tar.xz";
        hash = "sha256-BJH3sC9VwiB362eL8xTB+RdSS9UHz1tlgjm/mKRyM6E=";
      }
      {
        version = "9.3.0.75";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.6";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-aarch64/cudnn-linux-aarch64-9.3.0.75_cuda12-archive.tar.xz";
        hash = "sha256-Gq5L/O1j+TC0Z3+eko4ZeHjezi7dUcqPp6uDY9Dm7WA=";
      }
      {
        version = "9.7.1.26";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-aarch64/cudnn-linux-aarch64-9.7.1.26_cuda12-archive.tar.xz";
        hash = "sha256-jDPWAXKOiJYpblPwg5FUSh7F0Dgg59LLnd+pX9y7r1w=";
      }
      {
        version = "9.8.0.87";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-aarch64/cudnn-linux-aarch64-9.8.0.87_cuda12-archive.tar.xz";
        hash = "sha256-8D7OP/B9FxnwYhiXOoeXzsG+OHzDF7qrW7EY3JiBmec=";
      }
    ];
    # powerpc
    linux-ppc64le = [ ];
    # server-grade arm
    linux-sbsa = [
      {
        version = "8.4.1.50";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.7";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.4.1.50_cuda11.6-archive.tar.xz";
        hash = "sha256-CxufrFt4l04v2qp0hD2xj2Ns6PPZmdYv8qYVuZePw2A=";
      }
      {
        version = "8.5.0.96";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.7";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.5.0.96_cuda11-archive.tar.xz";
        hash = "sha256-hngKu+zUY05zY/rR0ACuI7eQWl+Dg73b9zMsaTR5Hd4=";
      }
      {
        version = "8.6.0.163";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.6.0.163_cuda11-archive.tar.xz";
        hash = "sha256-oCAieNPL1POtw/eBa/9gcWIcsEKwkDaYtHesrIkorAY=";
      }
      {
        version = "8.7.0.84";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.7.0.84_cuda11-archive.tar.xz";
        hash = "sha256-z5Z/eNv2wHUkPMg6oYdZ43DbN1SqFbEqChTov2ejqdQ=";
      }
      {
        version = "8.8.1.3";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.8.1.3_cuda11-archive.tar.xz";
        hash = "sha256-OzWq+aQkmIbZONmWSYyFoZzem3RldoXyJy7GVT6GM1k=";
      }
      {
        version = "8.8.1.3";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.0";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.8.1.3_cuda12-archive.tar.xz";
        hash = "sha256-njl3qhudBuuGC1gqyJM2MGdaAkMCnCWb/sW7VpmGfSA=";
      }
      {
        version = "8.9.7.29";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.9.7.29_cuda11-archive.tar.xz";
        hash = "sha256-kcN8+0WPVBQZ6YUQ8TqvWXXAIyxhPhi3djhUkAdO6hc=";
      }
      {
        version = "8.9.7.29";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-8.9.7.29_cuda12-archive.tar.xz";
        hash = "sha256-6Yt8gAEHheXVygHuTOm1sMjHNYfqb4ZIvjTT+NHUe9E=";
      }
      {
        version = "9.3.0.75";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.6";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-9.3.0.75_cuda12-archive.tar.xz";
        hash = "sha256-Eibdm5iciYY4VSlj0ACjz7uKCgy5uvjLCear137X1jk=";
      }
      {
        version = "9.3.0.75";
        minCudaVersion = "11.8";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-9.3.0.75_cuda11-archive.tar.xz";
        hash = "sha256-BLVvv3vuFcJOM5wrqU0Xqoi54zTQzRnnWFPcVFJ5S/c=";
      }
      {
        version = "9.7.1.26";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-9.7.1.26_cuda12-archive.tar.xz";
        hash = "sha256-koJFUKlesnWwbJCZhBDhLOBRQOBQjwkFZExlTJ7Xp2Q=";
      }
      {
        version = "9.7.1.26";
        minCudaVersion = "11.8";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-9.7.1.26_cuda11-archive.tar.xz";
        hash = "sha256-JcpY/ylUAaj37bzrJlerSDxO5KgPmpL40Mvl8VquHN4=";
      }
      {
        version = "9.8.0.87";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-9.8.0.87_cuda12-archive.tar.xz";
        hash = "sha256-IvYvR08MuzW+9UCtsdhB2mPJzT33azxOQwEPQ2ss2Fw=";
      }
      {
        version = "9.8.0.87";
        minCudaVersion = "11.8";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-9.8.0.87_cuda11-archive.tar.xz";
        hash = "sha256-j/EXcV+zMjAy0bSJiAEXVWrYteV6kGAUPwy3I4TbdxA=";
      }
      {
        version = "9.11.0.98";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.9";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-9.11.0.98_cuda12-archive.tar.xz";
        hash = "sha256-X81kUdiKnTt/rLwASB+l4rsV8sptxvhuCysgG8QuzVY=";
      }

    ];
    # x86_64
    linux-x86_64 = [
      {
        version = "8.0.5.39";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.0";
        url = "https://developer.download.nvidia.com/compute/redist/cudnn/v8.0.5/cudnn-11.0-linux-x64-v8.0.5.39.tgz";
        hash = "sha256-ThbueJXetKixwZS4ErpJWG730mkCBRQB03F1EYmKm3M=";
      }
      {
        version = "8.0.5.39";
        minCudaVersion = "11.1";
        maxCudaVersion = "11.1";
        url = "https://developer.download.nvidia.com/compute/redist/cudnn/v8.0.5/cudnn-11.1-linux-x64-v8.0.5.39.tgz";
        hash = "sha256-HQRr+nk5navMb2yxUHkYdUQ5RC6gyp4Pvs3URvmwDM4=";
      }
      {
        version = "8.1.1.33";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.2";
        url = "https://developer.download.nvidia.com/compute/redist/cudnn/v8.1.1/cudnn-11.2-linux-x64-v8.1.1.33.tgz";
        hash = "sha256-mKh4TpKGLyABjSDCgbMNSgzZUfk2lPZDPM9K6cUCumo=";
      }
      {
        version = "8.2.4.15";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.4";
        url = "https://developer.download.nvidia.com/compute/redist/cudnn/v8.2.4/cudnn-11.4-linux-x64-v8.2.4.15.tgz";
        hash = "sha256-Dl0t+JC5ln76ZhnaQhMQ2XMjVlp58FoajLm3Fluq0Nc=";
      }
      {
        version = "8.3.3.40";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.6";
        url = "https://developer.download.nvidia.com/compute/redist/cudnn/v8.3.3/local_installers/11.5/cudnn-linux-x86_64-8.3.3.40_cuda11.5-archive.tar.xz";
        hash = "sha256-6r6Wx1zwPqT1N5iU2RTx+K4UzqsSGYnoSwg22Sf7dzE=";
      }
      {
        version = "8.4.1.50";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.7";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.4.1.50_cuda11.6-archive.tar.xz";
        hash = "sha256-7JbSN22B/KQr3T1MPXBambKaBlurV/kgVhx2PinGfQE=";
      }
      {
        version = "8.5.0.96";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.7";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.5.0.96_cuda11-archive.tar.xz";
        hash = "sha256-VFSm/ZTwCHKMqumtrZk8ToXvNjAuJrzkO+p9RYpee20=";
      }
      {
        version = "8.6.0.163";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.6.0.163_cuda11-archive.tar.xz";
        hash = "sha256-u8OW30cpTGV+3AnGAGdNYIyxv8gLgtz0VHBgwhcRFZ4=";
      }
      {
        version = "8.7.0.84";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.7.0.84_cuda11-archive.tar.xz";
        hash = "sha256-l2xMunIzyXrnQAavq1Fyl2MAukD1slCiH4z3H1nJ920=";
      }
      {
        version = "8.8.1.3";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.8.1.3_cuda11-archive.tar.xz";
        hash = "sha256-r3WEyuDMVSS1kT7wjCm6YVQRPGDrCjegWQqRtRWoqPk=";
      }
      {
        version = "8.8.1.3";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.0";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.8.1.3_cuda12-archive.tar.xz";
        hash = "sha256-edd6dpx+cXWrx7XC7VxJQUjAYYqGQThyLIh/lcYjd3w=";
      }
      {
        version = "8.9.7.29";
        minCudaVersion = "11.0";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.9.7.29_cuda11-archive.tar.xz";
        hash = "sha256-o+JQkCjOzaARfOWg9CEGNG6C6G05D0u5R1r8l2x3QC4=";
      }
      {
        version = "8.9.7.29";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz";
        hash = "sha256-R1MzYlx+QqevPKCy91BqEG4wyTsaoAgc2cE++24h47s=";
      }
      {
        version = "9.3.0.75";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.6";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.3.0.75_cuda12-archive.tar.xz";
        hash = "sha256-PW7xCqBtyTOaR34rBX4IX/hQC73ueeQsfhNlXJ7/LCY=";
      }
      {
        version = "9.3.0.75";
        minCudaVersion = "11.8";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.3.0.75_cuda11-archive.tar.xz";
        hash = "sha256-Bp2ghM02jzn7gw1MTpMYAwZPtl52b0z33y2ko0aiup8";
      }
      {
        version = "9.7.1.26";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.7.1.26_cuda12-archive.tar.xz";
        hash = "sha256-EJpeXGvN9Dlub2Pz+GLtLc8W7pPuA03HBKGxG98AwLE=";
      }
      {
        version = "9.7.1.26";
        minCudaVersion = "11.8";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.7.1.26_cuda11-archive.tar.xz";
        hash = "sha256-c6rfLRtyGjS9e5CQjQKQYlfyrdvSRs+NtY4h1o2FXqI=";
      }
      {
        version = "9.8.0.87";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.8.0.87_cuda12-archive.tar.xz";
        hash = "sha256-MhubM7sSh0BNk9VnLTUvFv6rxLIgrGrguG5LJ/JX3PQ=";
      }
      {
        version = "9.8.0.87";
        minCudaVersion = "11.8";
        maxCudaVersion = "11.8";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.8.0.87_cuda11-archive.tar.xz";
        hash = "sha256-z03674MR2YfWQKMi9mjNUkCsPlMCq+lhfdmRtbJTJ1g=";
      }
      {
        version = "9.11.0.98";
        minCudaVersion = "12.0";
        maxCudaVersion = "12.9";
        url = "https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.11.0.98_cuda12-archive.tar.xz";
        hash = "sha256-tgyPrQH6FSHS5x7TiIe5BHjX8Hs9pJ/WirEYqf7k2kg=";
      }
    ];
  };
}

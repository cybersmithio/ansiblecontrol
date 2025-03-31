# Building The Image


docker build -t cybersmithio/ansiblecontrol:20250331 ./ -f Dockerfile
docker push cybersmithio/ansiblecontrol:20250331


# Running the image
docker pull cybersmithio/ansiblecontrol:20250331
docker run --rm -it --name ansiblecontrol ansiblecontrol
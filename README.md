# Overview
This image is an Ansible control node that can be used to build target systems.  
Having a control node in a container image allows for easy deployment into an offline environment.



# Building
Build the image is as simple as running this command on an Internet connected system:
```
docker build -t cybersmithio/ansiblecontrol:20250331 ./ -f Dockerfile
```

Saving the image is done with the command below.  If you are building this yourself,
you will want to change the repository from "cybersmithio" to your own repo.
```
docker push cybersmithio/ansiblecontrol:20250331
```

If you want to save the image into a file, use this command:
```
docker save cybersmithio/ansiblecontrol:20250331 > ansiblecontrol.20250331.docker
```


# Loading
To get the image onto a system that is connected to the Internet, simply run this command:
```
docker pull cybersmithio/ansiblecontrol:20250331
```

If you are running in an offline environment that has no Internet connection, transfer the image file created in the Building section to the container host system.
Then run this command to load the image into your container software:
```
docker load -i ansiblecontrol.20250331.docker
```

# Running
Once the image is on the system, it can be run with this command:
```
docker run --rm -it --name ansiblecontrol cybersmithio/ansiblecontrol:20250331
```


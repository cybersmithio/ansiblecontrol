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
Running the container image requires it to be loaded onto the host system.  See the previous section on loading.

While you can run the image without any Ansible files, that will mean that when the container is deleted so is your work.  
So you will want to create a directory on the container host that has all the Ansible inventory, playbooks, and other files.
In the examples below that directory is /home/jsmith/ansible

This example is running the image on a Windows Docker system:
```
docker run --rm -it --name ansiblecontrol --mount type=bind,source=/c/Users/jsmith/ansible,target=/ansible cybersmithio/ansiblecontrol:20250331
```

To run the image using podman on a Linux system.  The ":z" at the end of the volume parameter allows the directory to be read on a system running SELinux:
```
podman run -rm -it --name ansiblecontrol --volume /home/jsmith/ansible:/ansible:z cybersmithio/ansiblecontrol:20250331
```


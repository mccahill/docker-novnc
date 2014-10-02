docker-novnc
============

This is a minimal image which will help you run X server with openbox on the docker container and access it from ANY recent browser without requiring you to do any configuration on the client side.


## Why?

Provide system application accessible over the web without requiring the clients to install any  VNC client software, perhaps to provide remote access to applications running in docker containers for students doing coursework.


## How do I run this?
```
docker build -t novnc .
docker run -td -p 6080:6080 novnc

```

Now visit 

http://kanaka.github.io/noVNC/noVNC/vnc.html 

and enter

Host: the public IP of your docker host/server.
Post: 6080
Password: the password set in the docker build file (badpassword if you didn't change anything)

Click connect you should see a nice display within your browser, just right click and open terminal or firefox.

For access within lan / localhost : visit http://localhost:6080 or http://privateip:6080
if you are running it in a local docker host or lan ip . click connect. You are good to go.


## This is a minimal Image

Firefox & LibreOffice are installed. 
You probably will want to install some other apps.

## To Do

Encrypted sessions
Setup a LXDE version for a more desktop like setup


## Support

### http://dockerteam.com for Docker support.

## Credits

#### Paim Pozhil's initial work on a NoVNC Docker container --  https://github.com/paimpozhil/docker-novnc
#### NoVNC http -- //kanaka.github.io/noVNC/

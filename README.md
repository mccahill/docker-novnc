docker-novnc
============

This is a minimal image which will help you run X server with openbox on the docker container and access it from ANY recent browser without requiring you to do any configuration on the client side.


## Why?

Provide system application accessible over the web without requiring the clients to install any  VNC client software, perhaps to provide remote access to applications running in docker containers for students doing coursework.


## How do I run this?

First, generate a self-signed cert for noVNC with this command
```
openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem

```

Now you have a self.pem file and can build and run the Docker container:
```
docker build -t novnc .

docker run -td -p 6080:6080

``` 

To access X via NoVNC, you now need to get the web browser to accept your 
funky self-signed certificate, so go to this URL:

``` 
https://YOUR.HOST.HERE/vnc.html 
``` 
and reassure your browser that it should trust the site, despite the questionable certificate.
Or better yet, get a certificate that your browser will trust without user-intervention.

After the browser trusts the certificate, you can go to a magic URL to automagically log in
because the parameters in the URL configure the appropriate settings in the NoVNC client:

```
https://YOUR.HOST.HERE:6080/vnc.html?host=YOUR.HOST.HERE&port=6080&encrypt=1&autoconnect=1&password=badpassword
```

Alternatively, you can go old-school and click on the connect button, and fill out the parameters manually if
you use a URL like this:

```
https://YOUR.HOST.HERE:6080/vnc.html?host=YOUR.HOST.HERE&port=6080
```



## This is a minimal Image

Firefox & LibreOffice are installed. 
You probably will want to install some other apps.

## To Do

- pass the RFBAuth password in as a parameter so we can have a different password for each instance of the container
- setup a LXDE version for a more desktop like setup


## Support

http://dockerteam.com for Docker support.

## Credits

Paim Pozhil's initial work on a NoVNC Docker container --  https://github.com/paimpozhil/docker-novnc

NoVNC -- http://kanaka.github.io/noVNC/

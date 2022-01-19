# divid-docker
dockerized divi daemon

## Usage:
Create a divi-data folder and create a basic divi.conf file
(for example from here https://wiki.diviproject.org/#remote-node-configuration)

Build the image:

$ docker build -t divi-daemon https://raw.githubusercontent.com/siverpro/divid-docker/main/Dockerfile

Run the image:

$ docker run -d -v /path/to/local/datadir:/divi -p 51472:51472/tcp --name divi-daemon --restart unless-stopped divi-daemon

Your container should start. You can interact with the cli using the following command:

$ docker exex -it divi-daemon divi-cli <command>

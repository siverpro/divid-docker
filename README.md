# divid-docker
dockerized divi daemon

## Usage:
Create a divi-data folder and create a basic divi.conf file
(for example from here https://wiki.diviproject.org/#remote-node-configuration)

Download this dockerfile.
Build the image:
$ docker build -t divi-daemon .

Run the image:
$ docker run -d --rm -v /path/to/local/datadir:/divi --name divi-daemon divi-daemon

Your container should start. You can interact with the cli using the following command:
$ docker exex -it divi-daemon divi-cli <command>

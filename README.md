Test
# Alumni Web App API

## Getting Started
Welcome!!  This app is the starter project for the Udacity Alumni Web Application project.  More information will be provided here and in [the Udacity Alumni Wiki](https://github.com/udacityalumni/resources/wiki) as it becomes available.

The docker container will do _all_ of the networking between the database and app and will start a rails server.

To open the correct URL in your web browser, you can run the following

```
open "http://$(docker-machine ip default):3000"
```

Which will print out the IP of the docker-machine and open a web browser to the correct URL where the server is serving from.

### Installing
The installation is completely automated by Docker.  Please reference the [Docker installation guide](https://docs.docker.com/engine/installation/) if you need any help getting setup.

To start, clone the repository using git clone:
```
git clone https://github.com/udacityalumni/alumni-api.git
```

Running
```
docker-compose up
```
will do all of the heavy lifting for you in getting your app setup.

Once installed, to access the docker container internally, please run
```
docker exec -it alumniapi_app_1 bash
```

In this example, the app container is named alumniapi_app_1.  Please substitute the name of the container if the command fails due to the container name being changed. You can locate the container's name from listing all docker containers with:  `docker ps -a`.

#### Use without Docker
The app can be run without Docker, if you are not favorible to it.  You will want to get Rails v.5.0 and Ruby 2.3.1 installed on your machine.  You can follow the guide [located here](http://railsapps.github.io/installing-rails.html).

You must run the database setup scripts seperately.  

```
bundle install
rake db:migrate db:seed
```

## Style and Linting
The app is setup to use rubocop to lint from both the commandline and within text editors.  Note that some of the generated code may fail the rubocop tests, but during development we need to ensure that our code is statically analyzed.

The pipeline for linting has been baked right into the testing rake commands.
The following
```
rake validate
```

will run both rubocop and the unit tests.

On top of rubocop, another tool that we can use to increase the quality of our code is [Ruby Critic](https://github.com/whitesmith/rubycritic#getting-started).  The gem is included with the repository and can be implemented through the commandline.

For help:
```
rubycritic --help
```

## Deployment
TBD

## Built With
Rails v5 Api Mode

## Authors

* **Ryan Collins**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
Thanks to everyone of the amazing contributors!

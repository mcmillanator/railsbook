# README

This is a docker compose service which runs Ruby on Rails and Jupyer Lab in a single docker container.
This allows you to develop a Rails application while using Jupyter Notebook to document the process.


The container will act as a rails executable when given the `rails` argument.
For example ```alias rails='docker run -v `pwd`:/srv -it --rm docker.io/mcmillanator/jupyter-on-rails rails'``

## Dependencies

* docker
* docker compose

# Start

start the container
`docker compose up`

Watch the logs for the login URL and open it in a browser. This URL will have the authentication token

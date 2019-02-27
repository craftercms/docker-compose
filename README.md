# Crafter CMS Docker Compose

This project provides Docker compose files that allow you to run Docker containers for the following Crafter CMS 
environments:

* Authoring
* Delivery
* Serverless Delivery (content stored in S3)

# Pre-requisites

1. Install Docker (https://docs.docker.com/install/)
2. Install Docker Compose (https://docs.docker.com/compose/install/)

# Start Authoring Environment

1. `cd authoring`.
2. `docker-compose up` to run the containers in the foreground or `docker-compose up -d` to run them detached in the 
background.

# Start Delivery Environment

1. Start the Authoring environment.
2. `cd delivery`.
3. `docker-compose up` to run the containers in the foreground or `docker-compose up -d` to run them detached in the 
background.

## Create Delivery Site

1. Log into the Delivery Deployer container: `docker exec -it delivery_deployer_1 bash`.
2. Create site by calling `init-site.sh` script (the authoring data folder is mounted under `/data/authoring`): 
`./bin/init-site.sh mysite /data/authoring/repos/sites/mysite/published`.

# Start Serverless Delivery Environment

1. Start the Authoring environment.
2. Follow https://docs.craftercms.org/en/3.1/developers/cook-books/how-tos/setting-up-a-serverless-site.html to setup
deployment to S3 for Delivery.
3. `cd serverless/s3/delivery`.
4. Copy `config/engine/server-config.properties.example` to `config/engine/server-config.properties` and edit the
file to specify the required properties to read the content from Delivery (mostly just replace what's in `<>`).
5. `docker-compose up` to run the containers in the foreground or `docker-compose up -d` to run them detached in the 
background.
# inception
A Hive Helsinki school project. Keywords: System administration, Docker, Container management<br />
<br />
The goal:<br />
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine. The project consists in having you set up a small infrastructure composed of different services under specific rules.<br />
<br />
General guidelines:<br />
• This project need to be done on a Virtual Machine.<br />
• All the files required for the configuration of your project must be placed in a srcs folder.<br />
• A Makefile is required and must set up your entire application (i.e., it has to build the Docker images using docker-compose.yml).<br />
<br />
The specifics:<br />
• Each Docker image must have the same name as its corresponding service.<br />
• Each service has to run in a dedicated container.<br />
• The containers must be built either from the penultimate stable version of Alpine or Debian.<br />
• You have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your docker-compose.yml by your Makefile. It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).<br />
<br />
You need to to set up:<br />
&emsp;• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only. Your NGINX container must be the only entrypoint into your
infrastructure via the port 443 only.<br />
&emsp;• A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.<br />
&emsp;• A Docker container that contains MariaDB only without nginx.<br />
&emsp;• A volume that contains your WordPress database.<br />
&emsp;• A second volume that contains your WordPress website files.<br />
&emsp;• A docker-network that establishes the connection between your containers.<br />
&emsp;• Your containers have to restart in case of a crash.<br />
&emsp;• The following hacky patches are prohibited: tail -f, bash, sleep infinity, while true.<br />
&emsp;• The latest tag is prohibited.<br />

<br />
Note: The project requires .env file to run.

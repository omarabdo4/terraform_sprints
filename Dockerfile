FROM jenkins/jenkins:lts-jdk11
USER root

# RUN apt-get update -qq \
#     && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common

# # Adding docker repo
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# # Updating the apt repos
# RUN apt-get update  -qq 

# # Installing docker
# RUN apt-get install docker-ce -y
# RUN usermod -aG docker jenkins
# RUN service docker start


# Installing terraform
RUN apt-get update && apt-get install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install terraform

# Installing ssh agent
RUN apt-get install openssh-client
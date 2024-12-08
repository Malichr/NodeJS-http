FROM jenkins/jenkins:lts 

USER root 

ENV JENKINS_HOME /var/jenkins_home 
VOLUME /var/jenkins_home 

# Docker socket elérhetőség
RUN if ! getent group docker; then \
        groupadd -g 999 docker; \
    fi && usermod -aG docker jenkins 
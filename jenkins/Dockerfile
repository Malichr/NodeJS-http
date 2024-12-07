# Jenkins alap image
FROM jenkins/jenkins:lts

# Docker CLI telepítése a konténeren belül
USER root

# Jenkins home konfiguráció
ENV JENKINS_HOME /var/jenkins_home
VOLUME /var/jenkins_home

# Docker socket elérhetőség
RUN if ! getent group docker; then \
        groupadd -g 999 docker; \
    fi && usermod -aG docker jenkins

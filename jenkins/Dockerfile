# Jenkins alap image
FROM jenkins/jenkins:lts

# Docker CLI telepítése a konténeren belül
USER root

# Jenkins home konfiguráció
ENV JENKINS_HOME /var/jenkins_home
VOLUME /var/jenkins_home

# Docker socket elérhetőség
RUN groupadd -g 999 docker && usermod -aG docker jenkins

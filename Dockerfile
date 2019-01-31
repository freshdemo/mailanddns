FROM ubuntu

RUN     apt-get update && apt-get upgrade --fix-missing -y

# Install all prerequisites
RUN  apt-get install --assume-yes dovecot-imapd dovecot-pop3d exim4
RUN useradd phishme -m
RUN echo phishme:phishme | chpasswd
# If you want to make changes it can be beneficial to add things like the following
#RUN apt-get install --assume-yes vim lsof ssh netcat
ADD /exim4/ /etc/exim4/
RUN /etc/init.d/dovecot start
RUN /etc/init.d/exim4 start

EXPOSE 25/tcp
EXPOSE 110/tcp
EXPOSE 143/tcp


FROM debian

RUN     apt-get update && apt-get upgrade --fix-missing -y

# Install all prerequisites
RUN  apt-get install --assume-yes dovecot-imapd dovecot-pop3d exim4 bind9 bind9utils bind9-doc dnsutils vim
RUN useradd phishme -m
RUN echo phishme:phishme | chpasswd
# If you want to make changes it can be beneficial to add things like the following
#RUN apt-get install --assume-yes vim lsof ssh netcat

ADD /bind9/ /etc/bind/
ADD /exim4/ /etc/exim4/
ADD /start.sh /root/start.sh

EXPOSE 25/tcp
EXPOSE 993/tcp
EXPOSE 53/udp

#ENTRYPOINT ["sh /root/start.sh"]
CMD /root/start.sh

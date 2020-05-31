FROM debian

RUN     apt-get update && apt-get upgrade --fix-missing -y

# Install all prerequisites
RUN  apt-get install --assume-yes exim4 dovecot-imapd dovecot-pop3d bind9 bind9utils bind9-doc dnsutils vim

RUN useradd phishme -m
RUN echo phishme:phishme | chpasswd

ADD /exim4/ /etc/exim4/
ADD /bind9/ /etc/bind/
ADD /resolv.conf /etc/resolv.conf
ADD /start.sh /root/start.sh

EXPOSE 2225/tcp
EXPOSE 993/tcp
EXPOSE 53/udp

#ENTRYPOINT ["sh /root/start.sh"]
CMD /root/start.sh

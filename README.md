This repo contains a Dockerfile and a few configuration files that will allow you to deploy an email server inside a Docker container.

The container is deployed using Ubuntu, Dovecot, and Exim4.

This server is configured to relay all domains and should definitely never be used for production. The purpose of this container is to demonstrate phishing attacks locally.


Deployment:

Step 1 - Download the files manually or git clone https://github.com/freshdemo/mailrelay.git

Step 2 - Build the image with; docker build . -t mailer

Step 3 - Create the container from the image with; docker run -p 25:25 -p 143:143 -ti (image number which can be found using docker images)

Step 4 - Start the services with /etc/init.d/dovecot start ; /etc/init.d/exim4 start

Step 5 - At this point you should be able to access IMAP and SMTP on the IP address of the host (i.e. your laptop IP).


At this point your would do things like configure the email account on a victim system and then send phishing emails to it from your system of choice. A user account is already setup with phishme:phishme, and you can send emails to phishme@<container name found as the hostname or in docker ps -a>.

Look for tags labs and freshdemo on the intranet to find some use cases. Enjoy!

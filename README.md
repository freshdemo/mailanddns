This repo contains a Dockerfile and a few configuration files that will allow you to deploy email and DNS servers inside a Docker container.

The container is deployed using Debian, Dovecot, Exim4, and Bind9.

This server is configured to relay all domains and should definitely never be used for production. The purpose of this container is to demonstrate various stages of the attack chain. You can run it directly from your labtop for local demonstrations. It can be run from a Docker instance in any IaaS. It doesn't run well in AWS/Azure container services due to some current limitations (Azure can't change container hostnames which makes email difficult, Azure does not want email or DNS servers and changing the DNS port is difficult on most clients, AWS won't allow UDP currently, and AWS starts a cluster of t3.micro instances so not just a container service and probably overkill).


Deployment:

Step 1 - Download the files manually or git clone https://github.com/freshdemo/mailrelay.git

Step 2 - Build the image with; docker build . -t freshdemo/mailanddns

Step 3 - Create the container from the image with (Microsoft doesn't even really want mail servers in Azure hence the port change); docker run -p 2225:2225 -p 993:993 -p 53:53 -d (image number which can be found using docker images)

Step 4 (optional) - Edit the zone files in /etc/bind/ which currently host example.com for email and a couple of known malicious domains.

Step 5 - At this point you should be able to access SMTP, IMAPS, and DNS on the IP address of the host (i.e. your laptop IP).


At this point your would do things like configure the email account on a victim system and then send phishing emails to it from your system of choice. A user account is already setup with phishme:phishme, and you can send emails to phishme@example.com (you can also use phishme@<container ID>.

Look for tags labs and freshdemo on the intranet to find some use cases. Enjoy!

**how to configure Postfix with Gmail on Ubuntu**

Switch to root user using below command:
# sudo su

1) Install Postfix on Ubuntu
# apt-get install libsasl2-modules postfix

2) Update Postfix main.cf file
# root@ip-172-31-0-205:/home/ubuntu# cat /etc/postfix/main.cf | grep ^myhostname
Output:
# myhostname = ip-172-31-0-205.ap-south-1.compute.internal

3) Generate Google App Password for Postfix
Log in to your email, then click the following link: Manage your account access and security settings.

Scroll down to “Signing into Google” and click 2-Step Verification. You may be asked for your password and a verification code before continuing. Ensure that 2-Step Verification is enabled.

Click the following link to Generate an App password for Postfix

4) Add Gmail Username and App Password to Postfix configuration
You need to add your username and password in this file sasl_passwd to this directory /etc/postfix/sasl/

Create /etc/postfix/sasl/sasl_passwd file and add your gmail ID and password we have just created using below command
# root@ip-172-31-0-205:/etc/postfix/sasl# sudo nano sasl_passwd

And add your gmail ID and password as shown in below:
# [smtp.gmail.com]:587 example@gmail.com:logwrbyaqcmwslqp

If you wants to check your gmail Id and password then run the below command:
# root@ip-172-31-0-205:/etc/postfix/sasl# cat /etc/postfix/sasl/sasl_passwd
Output:
# [smtp.gmail.com]:587example@gmail.com:logwrbyaqcmwslqp

create the hash file for Postfix using the postmap command
# postmap /etc/postfix/sasl/sasl_passwd

After execute postmap command you should have a new file named sasl_passwd.db in the /etc/postfix/.
# root@ip-172-31-0-205:/etc/postfix/sasl# ls
Output :
sasl_passwd  sasl_passwd.db

5) Secure Your Postfix Hash Database and Email Password Files
# chown root:root /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db
# chmod 0600 /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db

6) Configure Relay Host postfix with gmail
# sudo nano /etc/postfix/main.cf
Set the relayhost
# relayhost = [smtp.gmail.com]:587

If you want to check your relayhost set or not then run the below command and you will get output like this:
# root@ip-172-31-0-205:/etc/postfix# cat /etc/postfix/main.cf | grep -i ^relayhost
Output: 
relayhost = [smtp.gmail.com]:587

7) Add Custom Configuration 
# sudo nano /etc/postfix/main.cf

# Enable SASL authentication
smtp_sasl_auth_enable = yes
# Disallow methods that allow anonymous authentication
smtp_sasl_security_options = noanonymous
# Location of sasl_passwd
smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd
# Enable STARTTLS encryption
smtp_tls_security_level = encrypt
# Location of CA certificates
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt

You need to restart your postfix
# systemctl restart postfix

9) Send Email using sendmail

Lets test whether our SMTP server

sendmail example@gmail.com
From: root@gmail.com
Subject: Test mail
Testing Email
.
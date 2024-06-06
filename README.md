# Step-by-Step-Guide-to-Obtain-and-Configure-a-Wildcard-SSL-and-DigitalOcean-DNS
 This repository contains instructions and necessary files to set up Wildcard SSL certificates for your domain using Certbot with Apache and DigitalOcean DNS.

**Prerequisites**

* A server running Ubuntu.
* Apache installed and running.
* Python 3 and Certbot installed.

# Installation Steps

**Step 1: Install Certbot for Apache**
First, install Certbot for Apache to manage your SSL certificates.

```sh
sudo apt-get install python3-certbot-apache
```

**Step 2: Obtain an SSL Certificate for Apache**
Run the following command to obtain an SSL certificate for your domain:

```sh
sudo certbot --apache -m youremail@email.com -d example.com
```
Replace youremail@email.com with your email address and example.com with your domain name.

**Step 3: Install Certbot for DigitalOcean DNS**
Install the Certbot plugin for DigitalOcean DNS to manage wildcard certificates.

```sh
sudo apt install python3-certbot-dns-digitalocean
```

**Step 4: Verify Certbot Plugins**
Verify that the DigitalOcean DNS plugin is installed correctly:

```sh
certbot plugins
```

**Step 5: Create DigitalOcean Credentials File**
Create a credentials file for the DigitalOcean DNS API:

```sh
nano ~/certbot-creds.ini
```


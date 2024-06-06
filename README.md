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

Add the following line to the file:

```sh
dns_digitalocean_token = -------------------YOUR_DIGITALOCEAN_API_TOKEN----------------------------------
```

Replace the token with your actual DigitalOcean API token.

**Step 6: Secure the Credentials File**

Change the permissions of the credentials file to be readable only by the owner:

```sh
chmod 600 ~/certbot-creds.ini
```

**Step 7: Obtain a Wildcard SSL Certificate**

Run the following command to obtain a wildcard SSL certificate:

```sh
sudo certbot certonly --dns-digitalocean --dns-digitalocean-credentials ~/certbot-creds.ini -d '*.example.com'
```

Replace example.com with your domain name.


# How to Use the Script

**1. Save the Script:**
   
   Save the script to a file, for example, setup_certbot.sh.

**2. Make the Script Executable:**

Make the script executable by running:

```sh
chmod +x setup_certbot.sh
```

**3. Run the Script:**

Execute the script by running:

```sh
./setup_certbot.sh
```

The script will prompt you to enter your DigitalOcean API token, email address, and domain name. It will then proceed to install the necessary packages, configure Certbot for Apache, create the DigitalOcean credentials file, and obtain a wildcard SSL certificate for your domain.


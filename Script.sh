#!/bin/bash

# Function to prompt for user input
prompt_for_input() {
    read -p "Enter your DigitalOcean API token: " do_token
    read -p "Enter your email address: " email
    read -p "Enter your domain name (e.g., example.com): " domain
}

# Function to install required packages
install_packages() {
    echo "Installing Certbot for Apache..."
    sudo apt-get update
    sudo apt-get install -y python3-certbot-apache
    echo "Installing Certbot plugin for DigitalOcean DNS..."
    sudo apt-get install -y python3-certbot-dns-digitalocean
}

# Function to configure Certbot for Apache
configure_certbot_apache() {
    echo "Configuring Certbot for Apache..."
    sudo certbot --apache -m "$email" -d "$domain"
}

# Function to create DigitalOcean credentials file
create_credentials_file() {
    echo "Creating DigitalOcean credentials file..."
    cat <<EOF > ~/certbot-creds.ini
dns_digitalocean_token = $do_token
EOF
    chmod 600 ~/certbot-creds.ini
}

# Function to obtain wildcard SSL certificate
obtain_wildcard_certificate() {
    echo "Obtaining wildcard SSL certificate..."
    sudo certbot certonly --dns-digitalocean --dns-digitalocean-credentials ~/certbot-creds.ini -d "*.$domain"
}

# Main function to execute the steps
main() {
    prompt_for_input
    install_packages
    configure_certbot_apache
    create_credentials_file
    obtain_wildcard_certificate
}

# Execute the main function
main

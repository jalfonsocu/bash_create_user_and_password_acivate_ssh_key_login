#!/bin/bash

# Define variables
user="user"
password="user password"
ssh_key="user public key"

# Create the password
enc_pass=$(openssl passwd -1 $password)

# Create the user "user" with the specified password
useradd -m  -s /bin/bash -p $enc_pass $user

# Add the user "user" to the sudo group
usermod -aG sudo $user

# Create the .ssh folder in the user's home directory
mkdir /home/$user/.ssh

# Add the new SSH key to the user's authorized_keys file
echo $ssh_key > /home/$user/.ssh/authorized_keys

# Set the proper permissions for the .ssh folder and authorized_keys file
chmod 700 /home/$user/.ssh
chmod 600 /home/$user/.ssh/authorized_keys

# Change the ownership of the newly created folder to the new user
chown -R $user:$user /home/$user/.ssh

echo "Complete"

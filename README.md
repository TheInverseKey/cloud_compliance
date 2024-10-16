# Steamy Cloud Compliance


Are you tired of installing all the Steampipe/Powerpipe mods every time? Well, Steamy Cloud Compliance takes care of all of this.

FYI: This repo was designed for Ubuntu WSL2

## CLI Install

Install the CLI for your cloud environment:

### AWS
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

### Azure

```curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash```

### GCP

```
apt-get update && \
    apt-get install -y curl gnupg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt-get update -y && \
    apt-get install google-cloud-sdk -y
```

## Installation 

On WSL2 or Linux run the following:

```
git clone https://github.com/TheInverseKey/cloud_compliance
cd cloud_compliance
chmod +x ./install.sh
./install.sh
```

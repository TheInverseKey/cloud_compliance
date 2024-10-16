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

1. Install your cloud CLI above.
2. Authenticate to the cloud account you want to run the Steamy Cloud Compliance against.
3. Install Steamy Cloud Compliance via the commands below.

```
git clone https://github.com/TheInverseKey/cloud_compliance
cd cloud_compliance
chmod +x ./install.sh
./install.sh
```
4. In the `cloud_compliance` directory run the following command to start the steampipe dashboard `steampipe dashboard`
5. In a browser on the host machine navigate to the following URL: http://localhost:9194
6. Select the dashboard you want to run against the cloud environment(You can sort the dashboards by mod).

For more information about running your dashboards with different outputs or headless see the following documentation from Steampipe: 
https://hub.steampipe.io/
https://hub.powerpipe.io/

#!/bin/bash

sudo /bin/sh -c "$(curl -fsSL https://powerpipe.io/install/powerpipe.sh)"
powerpipe -v
sudo /bin/sh -c "$(curl -fsSL https://steampipe.io/install/steampipe.sh)"
steampipe -v
steampipe plugin install steampipe

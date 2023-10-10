#!/bin/bash

set -x

# Setup Apache redirector options
sed -i 's/AllowOverride none/All/' /etc/apache2/sites-available/default

a2enmod rewrite headers proxy_http SSL cache
a2enmod SSL rewrite proxy proxy_http
a2ensite 000-default-le-ssl.conf
a2dismod -f deflate
a2enmod rewrite headers proxy_http SSL cache
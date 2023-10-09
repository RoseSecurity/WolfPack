#!/bin/bash

set -x

# Install and configure Apache redirector
sudo apt-get update -y
sudo apt-get install apache2
sudo sed -i 's/^Override: none$/Override: All/' /etc/apache2/apache2.conf

echo -e '# .htaccess Start\nRewriteEngine On\nRewriteCond %{REQUEST_METHOD} ^(GET|POST) [NC]\nRewriteCond %{REQUEST_URI} ^/api/v1/2023/(.*)\$\nRewriteCond %{HTTP_USER_AGENT} "Mozilla/5.0 \\(Windows NT 10.0; Win64; x64\\) AppleWebKit/537.36 \\(KHTML, like Gecko\\) Chrome/113.0.0.0 Safari/537.36"\n\n# Rule for matching to redirect\nRewriteRule ^.*$ "https://10.8.0.2%{REQUEST_URI}" [P,L]' >> /var/www/html/.htaccess

a2enmod rewrite headers proxy_http SSL cache
a2enmod SSL rewrite proxy proxy_http
a2ensite 000-default-le-ssl.conf
a2dismod -f deflate
a2enmod rewrite headers proxy_http SSL cache

sudo systemctl start --now apache2

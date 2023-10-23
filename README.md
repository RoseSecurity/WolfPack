# :wolf: WolfPack

<p align="center">
  <img alt="WolfPack" src="img/wolfpack.png" >
</p>

---

WolfPack combines the capabilities of `Terraform` and `Packer` to streamline the deployment of red team redirectors on a large scale. This tool enables security professionals to efficiently scale out the creation and management of Apache redirectors, which mimic authentic websites. These redirectors act as a bridge, seamlessly redirecting incoming traffic to a controlled C2 infrastructure. WolfPack simplifies the process of setting up and configuring these deceptive elements, making it an invaluable asset for security testing and red teaming exercises.

## Installation:

Download the repository:

```Console
git clone https://github.com/RoseSecurity-Research/WolfPack.git
```

Ensure that you have downloaded [Packer](https://www.packer.io/) and [Terraform](https://www.terraform.io/) before continuing! This can be simply done using the following methods:

### Packer & Terraform Download Methods (MacOS): 

1.) Install Homebrew by entering this command into your terminal application: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`. Then install both packer and terraform via brew: 

```Bash
$ brew tap hashicorp/tap && brew update
$ brew cask install packer
$ brew cask install terraform
```

## Deployment:

To deploy WolfPack, ensure that you have an active AWS profile with credentials within your current terminal session before continuing with the following commands:

```Console
$ vim playbooks/apache_install.yaml
```

Locate the following lines and replace them with the `User-Agent` and IP address of your C2 server:

```yaml
    - name: Add .htaccess
      copy:
        dest: /var/www/.htaccess
        content: |
          # .htaccess Start
          RewriteEngine On
          RewriteCond %{REQUEST_METHOD} ^(GET|POST) [NC]
          RewriteCond %{REQUEST_URI} ^/api/v1/2023/(.*)$
          
          # Change the following to the User-Agent for callbacks
          RewriteCond %{HTTP_USER_AGENT} "Mozilla/5.0 \(Windows NT 10.0; Win64; x64) AppleWebKit/537.36 \(KHTML, like Gecko\) Chrome/113.0.0.0 Safari/537.36"

          # Change the following to your C2 IP Address
          RewriteRule ^.*$ "https://10.8.0.2%{REQUEST_URI}" [P,L]
```

Deploy the AMI:

```Console
$ cd images/redirector
$ packer init
$ packer build .
```

This will deploy a custom redirector AMI within your AWS account EC2 services. 

> [!NOTE]
> This code is undergoing development, so if you encounter any errors or have any enhancement requests, feel free to create an issue on this repository 

## Future Development:

- [ ] Add Let's Encrypt functionality for certificates
- [ ] Add Terraform for creation of VPC, subnets, and security groups
- [ ] Add support for downloading custom website pages for deployment with Apache
- [ ] Create Red Team C2 servers and collaboration suite


## References:

- [Packer and Terraform](https://developer.hashicorp.com/terraform/tutorials/provision/packer)

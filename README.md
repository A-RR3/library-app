# library-app
# Steps I have followed :
before creating an auto scaling group I made an instance to check that my ssh script is workable without adding any advanced details in aws instance.Then I have connected to it using SSH client as follows :

![image](https://github.com/A-RR3/library-app/assets/80533035/32afb335-c08b-4260-a891-1c3d10de0568)

I ran these commands and checked the node version 
- sudo apt update  : to update system packages
- sudo apt upgrade -y
- curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -   : to install the nodejs repo 
- sudo apt install nodejs curl -y
- git clone https://github.com/A-RR3/library-app.git app
- cd app && npm install
- npm run build
- sudo mv ./infrastructure/ubuntuapp.service /etc/systemd/system
- sudo systemctl daemon-reload
- sudo systemctl enable ubuntuapp.service
![image](https://github.com/A-RR3/library-app/assets/80533035/42fc16e4-adab-476f-9fd7-fb867e2c02d1)

Reconnect to the insance again :
![image](https://github.com/A-RR3/library-app/assets/80533035/d18e6671-08d6-46fc-a2ea-c3074234fbc3)

This command displays the logs related to my service:
![image](https://github.com/A-RR3/library-app/assets/80533035/4fa02ade-b944-4f17-891a-9b5d1401eb17)

## Auto Scaling Group Creation

1. make sure I have key pair and security group set in my AWS account
2. create lauch template :
   - Launch template name : arwas-temp
   - Amazon Machine Image (AMI): (free tier eligible) ubuntu
   - Instance type : t2-micro (free tier eligible)
   - added my key pair and security group
   - add the script in advanced details:

    ![image](https://github.com/A-RR3/library-app/assets/80533035/80df0900-482c-41a8-bde5-6c2309d57b51)



3. create an auto scaling group that includes the template and a target group .
   
![image](https://github.com/A-RR3/library-app/assets/80533035/f562aea6-26cd-4629-9329-55ff3d2f4173)



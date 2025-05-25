provider "aws" {
  region = "us-east-1"
}

variable "key_name" {
  default = "jenkins_key"
}

resource "aws_instance" "jenkins_master" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "Jenkins-Master"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y fontconfig openjdk-21-jre wget gnupg2

              # Add Jenkins repo key and source list
              wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
              echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

              # Install Jenkins
              apt-get update -y
              apt-get install -y jenkins

              # Start Jenkins
              systemctl enable jenkins
              systemctl start jenkins
              EOF
}

resource "aws_instance" "jenkins_slave" {
  count         = 2 
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "Jenkins-Slave-${count.index + 1}"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install openjdk-21-jdk -y
              EOF
}


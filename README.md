# Jenkins Master-Slave Architecture Setup

This project sets up a Jenkins Master-Slave (Controller-Agent) architecture to enable distributed builds and scalable CI/CD workflows.

## 📦 Project Overview

This repository includes:

- Configuration for Jenkins master setup
- Scripts or Terraform files to provision Jenkins agents (slaves)
- Setup for agent communication (SSH or JNLP)
- Instructions for automation on cloud or local environment

## 🧰 Technologies Used

- Jenkins (Controller & Agent)
- Terraform (for infrastructure as code)
- Docker (optional, for containerized agents)
- AWS/Azure/GCP (if cloud-based)
- Linux (Ubuntu preferred)

## 📁 Folder Structure

.
├── master/
│ └── jenkins_master_setup.sh
├── agent/
│ └── jenkins_agent_setup.sh
├── terraform/
│ └── main.tf
├── .gitignore
├── README.md

bash
Copy
Edit

## 🚀 How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/revtron/jenkins_master_slave-architecture.git
cd jenkins_master_slave-architecture
2. Set Up Jenkins Master
Navigate to the master/ directory and run the setup script:

bash
Copy
Edit
cd master
bash jenkins_master_setup.sh
3. Set Up Jenkins Agent(s)
In the agent/ directory:

bash
Copy
Edit
cd ../agent
bash jenkins_agent_setup.sh
Ensure the agent can communicate with the master (via SSH or JNLP).

4. (Optional) Provision Infrastructure
If using Terraform:

bash
Copy
Edit
cd terraform
terraform init
terraform apply

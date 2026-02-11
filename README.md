# Terraform Module: On-Premise Nginx Server

This repository provides a Terraform module designed for provisioning and managing an on-premise Nginx web server. It encapsulates the configuration necessary to deploy and configure Nginx on your own infrastructure, leveraging Terraform's Infrastructure as Code (IaC) capabilities.

## Project Structure

- `main.tf`: The primary Terraform configuration file, defining the resources and logic required to set up the Nginx server. This may include VM provisioning, network configuration, and Nginx installation/configuration commands.
- `variables.tf`: Defines input variables for the Terraform configuration, allowing for customization such as the target server details, Nginx configuration parameters, or listening ports.
- `outputs.tf`: Defines output values from the Terraform configuration, such as the Nginx server's IP address, or other relevant connection details.
- `README.md`: This file, providing an overview, setup, and usage instructions.

## How It Works

This Terraform module automates the deployment and basic configuration of an Nginx web server on-premise. Depending on the `main.tf` implementation, it typically involves:

1.  **Server Provisioning:** Creating a virtual machine (using providers like `libvirt`, `vsphere`, or `Proxmox`) or configuring an existing physical server.
2.  **Network Setup:** Ensuring network connectivity to the Nginx server.
3.  **Nginx Installation & Configuration:** Executing commands (often via `remote-exec` or `Ansible` provisioner) to install Nginx and apply initial configuration settings (e.g., serving static files, reverse proxy setup).

## Prerequisites

Before using this Terraform module, ensure you have:

*   **Terraform Installed:** Terraform CLI installed on your local machine.
*   **On-Premise Infrastructure:** Access to your on-premise virtualization platform (e.g., KVM/libvirt, VMware vSphere, Proxmox) or a target physical server.
*   **Provider Configuration:** Appropriate Terraform providers configured for your on-premise infrastructure (e.g., `libvirt`, `vsphere`, `null_resource` with `local-exec`/`remote-exec`).
*   **SSH Access:** SSH keys and credentials configured for accessing the target Nginx server.

## Getting Started

Follow these general steps to deploy an on-premise Nginx server:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/samuelngarciar/terraform-onpremise-nginx.git
    cd terraform-onpremise-nginx
    ```
2.  **Configure Variables:**
    *   Review `variables.tf` and create a `terraform.tfvars` file (or use `-var` flags) to provide values for your specific environment (e.g., VM details, SSH user, Nginx port).
3.  **Initialize Terraform:**
    ```bash
    terraform init
    ```
4.  **Review the plan:**
    ```bash
    terraform plan
    ```
    This command shows you what actions Terraform will take. Review it carefully.
5.  **Apply the configuration:**
    ```bash
    terraform apply
    ```
    Type `yes` when prompted to confirm the deployment.
6.  **Retrieve Outputs:** After successful application, retrieve important information:
    ```bash
    terraform output
    ```
7.  **Destroy the server (when no longer needed):**
    ```bash
    terraform destroy
    ```
    Type `yes` when prompted to confirm the destruction.

## Customization

The module is designed to be flexible. You can customize server specifications, network settings, and Nginx configurations by adjusting the input variables.

## Contribution

Feel free to fork this repository, make improvements, and submit pull requests.

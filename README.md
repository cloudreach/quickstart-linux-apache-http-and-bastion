# Deploy an Apache HTTP server with SSH access.

This demonstrates an AWS Quick Start which adds Linux apache HTTP and SSH bastion functionality to your AWS Cloud environment, it is illustrative only and not a recommended pattern. It deploys Linux hosts that provide secure access to your Linux instances in public or private subnets. Use this Quick Start as a building block for your Linux-based deployments on AWS. You can choose to create a new VPC environment for your Linux  hosts or deploy them into your existing VPC environment. After you deploy the Quick Start, you can add other AWS services, infrastructure components, and software layers to complete your test or production Linux environment on the AWS Cloud. This is shown in the below diagram, and includes Apache HTTP servers too.

![Demo Architecture](https://www.lucidchart.com/publicSegments/view/47ac9f5e-0d7c-45a5-a6f3-cb19476eeeb0/image.png)

## Getting Started with Demo.

- Create a keypair in the region you are deploying to named default.pem.
- Update quickstart-aws-httpserver/linux-http-and-bastion.template as needed and upload to quickstart-cloudreach S3 bucket.
- Update quickstart-aws-website-content assets as needed and upload this folder compressed to quickstart-cloudreach S3 bucket with name www.zip.

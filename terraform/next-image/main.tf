terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.14"
    }
  }
  required_version = ">= 1.0.0"
}

# Main AWS region where the resources should be created in
# Should be close to where your Next.js deployment is located
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "next_image_optimizer" {
  source             = "milliHQ/next-js-image-optimization/aws"
  deployment_name    = "coinhippo-next-image"
  next_image_domains = ["metadata.ens.domains", "coinhippo.io", "www.coinhippo.io"]
}

output "domain" {
  value = module.next_image_optimizer.cloudfront_domain_name
}
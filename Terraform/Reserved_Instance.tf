#A Reserved Instance (RI) is a billing option offered by Amazon Web Services (AWS) that provides you with a significant discount on EC2 instance usage in exchange for committing to use a specific instance type in a given region for a one-year or three-year term. This pricing model allows you to save up to 75% compared to on-demand instance pricing, depending on the instance type, region, and payment options.

#Reserved Instances are a cost-saving measure that is ideal for businesses or individuals with predictable workloads that require long-term usage of EC2 instances.


provider "aws" {
  region = "us-east-1" 
}
resource "aws_ec2_reserved_instances" "example" {
 
  instance_type = "t3.micro"  
  ami           = "ami-0c55b159cbfafe1f0"  
  term          = 1   # You can set this to 3 for a 3-year term
  payment_option = "AllUpfront"  # Choose between "AllUpfront", "PartialUpfront", or "NoUpfront"
  availability_zone = "us-east-1a"  # Optional, can be left out to allow AWS to choose the AZ
  instance_count  = 2  # The number of Reserved Instances to reserve
  offering_type    = "Standard"  # Choose "Standard" for maximum savings or "Convertible" for flexibility
}

output "reserved_instance_id" {
  value = aws_ec2_reserved_instances.example.id
}


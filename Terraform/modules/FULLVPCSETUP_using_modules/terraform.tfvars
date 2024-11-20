region = "us-east-1"
vpc_id = "aws_vpc.myvpc.id" #"vpc-963423"
vpcname = "FullVPCSETUP"
subnet_cidr = [ "10.0.1.0/24","10.0.2.0/24","10.0.3.0/24" ]
subnet_type = "public"
sgname = "VPCSECURITYGROUP"
sgnameoutput = "VPCSECURITYGROUPOUTPUT"
cidr_block = "10.0.0.0/16"
hostnames = true
support = true
availability_zone = [ "us-east-1a","us-east-1b","us-east-1c" ]
subnets = [ "subnet-1","subnet-2","subnet-3" ]
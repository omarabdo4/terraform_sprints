for dev workspace use this command :

terraform workspace select dev; terraform init; terraform apply --var-file dev.tfvars


for prod workspace use this command :

terraform workspace select prod; terraform init; terraform apply --var-file prod.tfvars
for dev workspace use this command :

terraform workspace select dev; terraform init; terraform apply --var-file dev.tfvars


for prod workspace use this command :

terraform workspace select prod; terraform init; terraform apply --var-file prod.tfvars



if you are using docker container you need to pass the following variables while running a container

-e AWS_ACCESS_KEY_ID=''
-e AWS_SECRET_ACCESS_KEY=''
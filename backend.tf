terraform {
  backend "s3" {
    bucket = "terraform-starter-bucket-b8uzs "
    key    = "projeto/terraform.tfstate" 
    region = "sa-east-1"                 
    
    # Se você utilizar um provedor S3 compatível (como o da HostDime Brasil), 
    # será necessário especificar o endpoint:
    # endpoint = "https://s3.amazonaws.com"
  }
}
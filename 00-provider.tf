provider "aws" {
  region                      = "us-east-1"
  access_key                  = "123"
  secret_key                  = "123"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_force_path_style         = true

  endpoints {
    dynamodb = "http://localhost:4566"
    kinesis  = "http://localhost:4566"
    s3       = "http://localhost:4566"
  }
}

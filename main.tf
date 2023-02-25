terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.39.0"
    }
  }

  backend "remote" {
    organization = "snowflake_terraform"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_role" "role" {
  name    = "ROLE_TERRAFORM"
  comment = "ROLE for Snowflake Terraform demo"
}

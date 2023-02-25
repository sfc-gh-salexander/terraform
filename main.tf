terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
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
  alias = "account_admin"
  role  = "ACCOUNTADMIN"
}

resource "snowflake_role" "role" {
  name    = "ROLE_TERRAFORM"
  comment = "ROLE for Snowflake Terraform demo"
}

resource "snowflake_role_grants" "grants" {
  provider  = snowflake.account_admin
  role_name = snowflake_role.role.ROLE_TERRAFORM
  users     = [snowflake_user.user.SALEXANDER]
}

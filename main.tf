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
}

resource "snowflake_role" "role" {
  name    = "ROLE_TERRAFORM"
  comment = "ROLE for Snowflake Terraform demo"
}

resource "snowflake_role_grants" "grants" {
  provider  = snowflake.accountadmin
  role_name = snowflake_role.role.role_terraform
  users     = [snowflake_user.user.salexander]
}

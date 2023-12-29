provider "snowflake" {
  account = "zdbpomt-gx19344"
}

module "snowflake" {
  source = "../.."

  env = "DEV"

  databases = {
    analytics = {
      name                        = "analytics"
      comment                     = "test comment"
      data_retention_time_in_days = 1
    }

    raw = {
      name                        = "raw"
      comment                     = "Where the Fivetran data lands"
      data_retention_time_in_days = 1
    }
  }

  warehouses = {
    loading = {
      name    = "fivetran"
      comment = "Used by Fivetran to load data into Snowflake"
      size    = "XSMALL"
    }

    transforming = {
      name    = "dbt"
      comment = "Used by the dbt role to transform data in Snowflake"
      size    = "XSMALL"
    }

    reporting = {
      name    = "metabase"
      comment = "Used by Metabase to query data in Snowflake"
      size    = "XSMALL"
    }
  }

  roles = {
    reporter = {
      name    = "fivetran"
      comment = "A role for Fivetran to use when loading data into Snowflake"
    }

    transformer = {
      name    = "dbt"
      comment = "A role for dbt to use when transforming data in Snowflake"
    }
  }
}

output "debug" {
  value = module.snowflake
}

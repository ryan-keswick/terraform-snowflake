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
      name    = "loading"
      comment = "Used by Fivetran to load data into Snowflake"
      size    = "XSMALL"
    }
  }
}

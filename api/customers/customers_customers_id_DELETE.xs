// Delete customers record.
query "customers/{customers_id}" verb=DELETE {
  api_group = "Customers"

  input {
    int customers_id? filters=min:1
  }

  stack {
    db.del customers {
      field_name = "id"
      field_value = $input.customers_id
    }
  }

  response = null
}
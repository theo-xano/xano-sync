// Get customers record
query "customers/{customers_id}" verb=GET {
  api_group = "Customers"

  input {
    int customers_id? filters=min:1
  }

  stack {
    db.get customers {
      field_name = "id"
      field_value = $input.customers_id
    } as $customers
  
    precondition ($customers != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $customers
}
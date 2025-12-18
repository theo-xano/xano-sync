// Add customers record
query customers verb=POST {
  api_group = "Customers"

  input {
    dblink {
      table = "customers"
    }
  }

  stack {
    db.add customers {
      data = {created_at: "now"}
    } as $customers
  }

  response = $customers
}
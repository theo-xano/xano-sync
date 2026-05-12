// Consolidates multiple database operations into a single efficient call
// Check for missing records and update properties efficiently
function check_missing_records {
  input {
  }

  stack {
    // Ensure the record exists and update all properties in one roundtrip
    db.add_or_edit "table_name with a space" {
      field_name = "id"
      field_value = 1
      data = {
        testjson: {function: "worked", onlyEdit: true, patch: true}
      }
    } as $record
  }

  response = $record
}
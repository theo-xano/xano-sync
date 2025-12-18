// Delete projects record.
query "projects/{projects_id}" verb=DELETE {
  api_group = "first test"

  input {
    int projects_id? filters=min:1
  }

  stack {
    db.del projects {
      field_name = "id"
      field_value = $input.projects_id
    }
  }

  response = null
}
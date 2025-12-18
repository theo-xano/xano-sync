// Get projects record
query "projects/{projects_id}" verb=GET {
  api_group = "first test"

  input {
    int projects_id? filters=min:1
  }

  stack {
    db.get projects {
      field_name = "id"
      field_value = $input.projects_id
    } as $projects
  
    precondition ($projects != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $projects
}
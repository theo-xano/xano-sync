// Edit projects record
query "projects/{projects_id}" verb=PATCH {
  api_group = "first test"

  input {
    int projects_id? filters=min:1
    dblink {
      table = "projects"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch projects {
      field_name = "id"
      field_value = $input.projects_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $projects
  }

  response = $projects
}
// Query all projects records
query projects verb=GET {
  api_group = "first test"

  input {
  }

  stack {
    db.query projects {
      return = {type: "list"}
    } as $projects
  }

  response = $projects
}
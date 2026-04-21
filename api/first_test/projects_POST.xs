// Add projects record
query projects verb=POST {
  api_group = "first test"

  input {
    dblink {
      table = "projects"
    }
  }

  stack {
    db.add projects {
      data = {created_at: "now"}
    } as $projects
  }

  response = $projects
}
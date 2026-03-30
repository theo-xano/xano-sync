query ddq verb=GET {
  api_group = "projects"

  input {
  }

  stack {
    db.direct_query {
      sql = "SELECT * FROM x1_33;"
      parser = "template_engine"
      response_type = "list"
    } as $x1
  }

  response = $x1
}
query ddq verb=GET {
  api_group = "projects"

  input {
  }

  stack {
    for (10) {
      each as $index {
        db.direct_query {
          sql = "SELECT * FROM x1_33;"
          parser = "template_engine"
          response_type = "list"
        } as $x1
      }
    }
  }

  response = $x1
}
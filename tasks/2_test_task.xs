task testTask {
  active = false

  stack {
    db.add dummy_data {
      data = {created_at: "now"}
    } as $dummy_data1
  }

  schedule = [{starts_on: 2025-09-05 21:26:49+0000, freq: 5}]
}
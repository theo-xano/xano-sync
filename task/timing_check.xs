task timingCheck {
  active = false

  stack {
    db.query content {
      return = {
        type  : "list"
        paging: {page: 1, per_page: 2, metadata: false}
      }
    } as $content1
  
    foreach ($content1) {
      each as $item {
        db.get dummy_data {
          field_name = "id"
          field_value = 1
        } as $dummy_data1
      
        security.create_uuid as $x1
        redis.set {
          key = $x1
          data = $item
          ttl = 300
        }
      }
    }
  }

  schedule = [{starts_on: 2025-11-25 22:55:19+0000, freq: 5}]
}
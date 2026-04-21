function editcheck {
  input {
    text method? filters=trim
  }

  stack {
    debug.log {
      value = {test: "value"|is_uuid}
    }
  
    !api.request {
      url = "http://google.com"
      method = "POST"
      headers = []
        |push:"testing"
        |push:("working"|concat:"test":"sadad")
      follow_location = false
      verify_host = false
      verify_peer = false
    } as $api1
  }

  response = $input.method
}
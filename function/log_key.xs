function "log-key" {
  input {
  }

  stack {
    redis.get {
      key = "redisKeyNew"
    } as $x1
  
    api.request {
      url = "https://webhook.site/cb9e3d45-abd2-4a98-b1e5-5f01c1d5ac28"
      method = "POST"
      params = {}|set:"redisKey":$x1
    } as $api1
  }

  response = $x1
}
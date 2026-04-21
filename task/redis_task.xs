task redisTask {
  active = false

  stack {
    function.run "log-key" as $func1
  }

  schedule = [{starts_on: 2025-08-07 21:28:40+0000, freq: 5}]
}
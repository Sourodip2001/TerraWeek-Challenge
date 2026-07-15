check "bucket_name_check" {

  assert {

    condition = length(var.bucket_name) > 5

    error_message = "Bucket name is too short."

  }

}
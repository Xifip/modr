CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID_Modr"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY_Modr"]
  }
  config.fog_directory = ENV["AWS_S3_Bucket_Modr"]
end

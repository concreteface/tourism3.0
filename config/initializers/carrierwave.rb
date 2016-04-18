# CarrierWave.configure do |config|
#   if !Rails.env.test?
#     config.fog_credentials = {
#       provider: "AWS",
#       aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
#       aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
#     }
#     config.fog_directory  = ENV["S3_BUCKET"]
#   end
# end

CarrierWave.configure do |config|
  config.cache_dir = '/tmp'
  if !Rails.env.test?
    config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     ENV["GOOGLE_ID"],
      google_storage_secret_access_key: ENV["GOOGLE_KEY"]
    }
    config.fog_directory = 'tourismproduction'
  end
end

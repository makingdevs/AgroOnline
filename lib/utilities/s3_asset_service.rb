class S3AssetService

  def initialize
    @bucket_region = ENV['aws_bucket_region']
    @bucket_name = ENV['aws_bucket_name']
  end

  def upload_image_to_s3(params)
     Aws.use_bundled_cert!
     s3 = Aws::S3::Resource.new(region: @bucket_region)
     file_to_upload = s3.bucket(@bucket_name).object("#{Time.now()}_#{params['file'].original_filename}")
     file_to_upload.upload_file(params['file'].tempfile, acl:'public-read')
     file_to_upload
  end

  def save_image_s3_asset(url_photo_s3,name_photo)
    s3Asset = S3Asset.new(url_photo_s3,name_photo)
    s3Asset.save
    s3Asset
  end

end

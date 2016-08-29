class S3Asset < ApplicationRecord
  has_attached_file :s3_asset,
    :styles => {
    :thumb1 => "200x100#"
  }
end

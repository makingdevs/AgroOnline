require 'aws-sdk'
puts Rails.application.mailer_host
Aws.config[:credentials] = Aws::Credentials.new(Rails.application.secrets.aws_access_key_id ,Rails.application.secrets.aws_access_key)

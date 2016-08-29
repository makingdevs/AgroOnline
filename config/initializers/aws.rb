require 'aws-sdk'
Aws.config[:credentials] = Aws::Credentials.new(ENV['aws_access_key_id'] , ENV['aws_secret_access_key'])

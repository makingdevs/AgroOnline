require 'elasticsearch/model'

bonsai = Rails.application.secrets.bonsai_url

if bonsai
    Elasticsearch::Model.client = Elasticsearch::Client.new({url: bonsai, logs: true})
end

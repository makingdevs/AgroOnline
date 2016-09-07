require 'elasticsearch/model'
class Category < ActiveRecord::Base
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

   belongs_to :s3_asset, optional:true

  def to_s
     name
   end

end

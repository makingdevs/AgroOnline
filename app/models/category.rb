require 'elasticsearch/model'
class Category < ActiveRecord::Base
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  def to_s
     name
   end

end

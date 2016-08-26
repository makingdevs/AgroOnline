require 'elasticsearch/model'
class Address < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def to_s
    street+" "+street_number+" "+zip_code+" "+colony+" "+country+" "+city+" "+town
  end

end

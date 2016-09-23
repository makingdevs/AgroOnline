class AddReferenceIntoProductAndTagAgain < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :tag, foreign_key: true
  end
end

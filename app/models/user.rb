class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_secure_password

  belongs_to :provider, optional:true

end

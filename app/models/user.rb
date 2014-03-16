class User < ActiveRecord::Base
  validates :email, :username, presence: true
end

class User < ApplicationRecord
  has_many :accounts, dependent: :delete_all
end

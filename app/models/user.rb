# frozen_string_literal: true
# user model
class User < ApplicationRecord
  has_many :accounts, dependent: :delete_all
end

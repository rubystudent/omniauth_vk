# frozen_string_literal: true
# account model
class Account < ApplicationRecord
  belongs_to :user
end

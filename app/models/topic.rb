class Topic < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  acts_as_followable
end

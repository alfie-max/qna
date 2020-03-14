class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :ans, presence: true
end

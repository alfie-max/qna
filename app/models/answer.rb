class Answer < ApplicationRecord
  belongs_to :question

  validates :ans, presence: true
end

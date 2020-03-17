class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :title, presence: true
end

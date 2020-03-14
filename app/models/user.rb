class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :questions, dependent: :destroy

  acts_as_follower
  acts_as_followable

  alias_attribute :following, :following_users
  alias_attribute :topics, :following_topics
end

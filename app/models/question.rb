class Question < ApplicationRecord
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  accepts_nested_attributes_for :topic,
                                reject_if: ->(s) { s[:name].blank? },
                                allow_destroy: true
end

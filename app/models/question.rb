class Question < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 40}
  validates :detail, presence: true, length: {minimum: 150}
end

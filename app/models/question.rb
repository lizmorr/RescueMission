class Question < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 40}
  validates :title, presence: true, length: {minimum: 150}
end

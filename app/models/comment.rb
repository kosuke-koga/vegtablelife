class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :diary
  
  validates :comment, presence: true, length: { maximum: 50}
end

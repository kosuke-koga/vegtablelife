# frozen_string_literal: true

class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  validates :action, presence: true
  validates :date, presence: true
end

# frozen_string_literal: true

class Diary < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  validates :action, presence: true
  validates :date, presence: true
end

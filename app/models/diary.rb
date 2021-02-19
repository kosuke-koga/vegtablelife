# frozen_string_literal: true

class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes
  mount_uploader :avatar, AvatarUploader

  validates :action, presence: true
  validates :date, presence: true

  scope :search, lambda { |search_params|
    return if search_params.blank?

    vegtable_like(search_params[:vegtable])
  }

  scope :vegtable_like, ->(vegtable) { where('vegtable LIKE ?', "%#{vegtable}%") if vegtable.present? }
end

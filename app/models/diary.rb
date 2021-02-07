# frozen_string_literal: true

class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  validates :action, presence: true
  validates :date, presence: true

  scope :search, -> (search_params) do
    return if search_params.blank?
    vegtable_like(search_params[:vegtable])
  end

  scope :vegtable_like, -> (vegtable) {where('vegtable LIKE ?', "%#{vegtable}") if vegtable.present? }

end

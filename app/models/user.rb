# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon, IconUploader

  validates :name, presence: true, length: { minimum: 2,maximum: 20}
  validates :text, length: { maximum: 100}

  has_many :diaries, dependent: :destroy
  has_many :comments, dependent: :destroy
end


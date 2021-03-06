# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon, IconUploader

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :text, length: { maximum: 100 }

  has_many :diaries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarks_diaries, through: :bookmarks, source: :diary

  def liked_by?(diary_id)
    likes.where(diary_id: diary_id).exists?
  end

  def bookmark(diary)
    bookmarks_diaries << diary
  end

  def unbookmark(diary)
    bookmarks_diaries.delete(diary)
  end

  def bookmark?(diary)
    Bookmark.where(user_id: id, diary_id: diary.id).exists?
  end
end

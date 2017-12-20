class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :subscriber, uniq: true, class_name: 'User', dependent: :destroy
  has_many :reviews

  STATUS = [:pending, :need_update, :approved, :rejected]

  enum status: [:pending, :need_update, :approved, :rejected]

  validates :title, presence: true
  validates :description, presence: true
  validates :cover_photo, presence: true
  validates :pdf, presence: true
  validates :status, presence: true

  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :pdf, PdfUploader

  def update_status(status)
    update_attribute(:status, status)
  end
end

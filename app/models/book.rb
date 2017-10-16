class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :subscriber, uniq: true, class_name: 'User', dependent: :destroy

  enum status: [ :pending, :need_update, :approved, :rejected ]

  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :pdf, PdfUploader
end

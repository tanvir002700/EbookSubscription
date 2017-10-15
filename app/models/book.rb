class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :subscriber, class_name: 'User'

  enum status: [ :pending, :need_update, :published, :rejected ]

  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :pdf, PdfUploader
end

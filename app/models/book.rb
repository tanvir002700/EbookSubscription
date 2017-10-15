class Book < ApplicationRecord
  belongs_to :user
  enum status: [ :pending, :need_update, :published, :rejected ]

  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :pdf, PdfUploader
end

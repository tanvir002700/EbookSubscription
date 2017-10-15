class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :pdf, PdfUploader
end

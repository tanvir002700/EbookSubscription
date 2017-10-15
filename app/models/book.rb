class Book < ApplicationRecord
  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :pdf, PdfUploader
end

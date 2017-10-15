class Book < ApplicationRecord
  has_one :cover_photo, as: :attachable, class_name: 'Attachment'
  has_one :pdf, as: :attachable, class_name: 'Attachment'

  accepts_nested_attributes_for :cover_photo, :pdf
end
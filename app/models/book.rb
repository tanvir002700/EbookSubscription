class Book < ApplicationRecord
  has_one :photo, as: :attachable, class_name: 'Attachment'
  has_one :attachment, as: :attachable
end

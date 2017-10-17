class Review < ApplicationRecord
  belongs_to :book

  enum previous_status: [ :pending, :need_update, :approved, :rejected ]
end

class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_and_belongs_to_many :subscribe_books, class_name: 'Book'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :timeoutable, :rememberable, :trackable, :validatable
end

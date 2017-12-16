require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      expect(Book.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has and belongs to many subscriber' do
      expect(Book.reflect_on_association(:subscriber).macro).to eq(:has_and_belongs_to_many)
    end
  end

  describe '#update_status' do
    let(:user) { FactoryGirl.create(:user) }
    let(:book) { FactoryGirl.create(:book, user: user) }
    it 'changes book status' do
      book.update_status(:approved)
      expect(Book.find(book.id).status).to eq('approved')
    end
  end
end

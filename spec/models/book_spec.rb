require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#update_status' do
    let(:user) { FactoryGirl.create(:user) }
    let(:book) { FactoryGirl.create(:book, user: user) }
    it 'changes book status' do
      book.update_status(:approved)
      expect(Book.find(book.id).status).to eq('approved')
    end
  end
end

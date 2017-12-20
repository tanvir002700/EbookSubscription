require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  describe 'associations' do
    it 'belongs to user' do
      expect(Book.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has and belongs to many subscriber' do
      expect(Book.reflect_on_association(:subscriber).macro).to eq(:has_and_belongs_to_many)
    end
  end

  describe 'validations' do
    context 'user presence' do
      let(:book) { FactoryGirl.build(:book) }
      it 'not validate' do
        expect(book).to_not be_valid
      end

      it 'validate' do
        book.user = user
        expect(book).to be_valid
      end
    end

    context 'title presence' do
      let(:book) { FactoryGirl.build(:book, user: user) }
      it 'validate' do
        expect(book).to be_valid
      end

      it 'not validate' do
        book.title = nil
        expect(book).to_not be_valid
      end
    end

    context 'description persence' do
      let(:book) { FactoryGirl.build(:book, user: user) }
      it 'validate' do
        expect(book).to be_valid
      end

      it 'not validate' do
        book.description = nil
        expect(book).to_not be_valid
      end
    end

    context 'cover_photo presence' do
      let(:book) { FactoryGirl.build(:book, user: user) }
      it 'validate' do
        expect(book).to be_valid
      end

      it 'not validate' do
        book.cover_photo = nil
        expect(book).to_not be_valid
      end
    end

    context 'pdf presence' do
      let(:book) { FactoryGirl.build(:book, user: user) }
      it 'validate' do
        expect(book).to be_valid
      end

      it 'not validate' do
        book.pdf = nil
        expect(book).to_not be_valid
      end
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

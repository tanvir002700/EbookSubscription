RSpec.describe Review, type: :model do
  describe 'associations' do
    it 'belongs to book' do
      expect(Review.reflect_on_association(:book).macro).to eq(:belongs_to)
    end
  end
end

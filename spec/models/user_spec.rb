# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  describe 'associations' do
    it 'have many books' do
      expect(User.reflect_on_association(:books).macro).to eq(:has_many)
    end

    it 'has and belongs to many subscribe_books' do
      expect(User.reflect_on_association(:subscribe_books).macro).to eq(:has_and_belongs_to_many)
    end
  end

  describe 'User roles' do
    context 'When a user is normal' do
      let(:u) { create :user }
      it 'has user roles only user' do
        expect(u.roles).to eq([:user])
      end
    end

    context 'When a user is publisher' do
      let(:u) { create :user, roles: [:publisher] }
      it 'has roles only publisher' do
        expect(u.roles).to eq([:publisher])
      end
    end

    context 'When a user is admin' do
      let(:u) { create :admin }
      it 'has only admin roles' do
        expect(u.roles).to eq([:admin])
      end
    end

    context 'When a user is admin, user, and publisher' do
      let(:u) { create :user, roles: [:user, :admin, :publisher] }
      it 'has all 3 roles' do
        expect(u.roles).to eq([:user, :admin, :publisher])
      end
    end
  end
end

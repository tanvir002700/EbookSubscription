RSpec.describe BookPolicy do
  subject { described_class }
  let(:user) { FactoryGirl.create(:user) }
  let!(:book) { FactoryGirl.create(:book, user: user) }

  context 'When user is admin user' do
    let(:admin) { FactoryGirl.create(:admin) }
    permissions :index?, :new?, :create? do
      it 'grants access' do
        expect(subject).to permit(admin, Book.new)
      end
    end

    permissions :subscribe?, :unsubscribe? do
      it 'grants access' do
        expect(subject).to permit(admin, book)
      end
    end

    permissions :edit?, :update?, :destroy? do
      it 'not grants access' do
        expect(subject).not_to permit(admin, book)
      end
    end
  end
end

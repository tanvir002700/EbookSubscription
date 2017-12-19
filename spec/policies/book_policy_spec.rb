RSpec.describe BookPolicy do
  subject { described_class }
  let(:user) { FactoryGirl.create(:user) }
  let!(:book) { FactoryGirl.create(:book, user: user) }

  context 'When user is admin user' do
    let(:admin) { FactoryGirl.create(:admin) }

    permissions :index?, :new?, :create?, :show? do
      it 'grants access' do
        expect(subject).to permit(admin, Book.new)
      end
    end

    permissions :subscribe?, :unsubscribe? do
      it 'grants access' do
        expect(subject).to permit(admin, book)
      end
    end

    permissions :published_index?, :uploaded_index?, :edit?, :update?, :destroy? do
      it 'not grants access' do
        expect(subject).not_to permit(admin, book)
      end
    end
  end

  context 'When user is normal user' do
    let(:user2) { FactoryGirl.create(:user) }

    permissions :index?, :edit?, :update?, :destroy?, :show? do
      it 'not grants access' do
        expect(subject).not_to permit(user2, book)
      end
    end

    permissions :published_index?, :subscribe?, :unsubscribe? do
      it 'grants access' do
        expect(subject).to permit(user2, book)
      end
    end
  end

  context 'When user is publisher' do
    permissions :uploaded_index?, :edit?, :update?, :destroy?, :show? do
      it 'grants access' do
        expect(subject).to permit(user, book)
      end
    end

    permissions :index?, :subscribe?, :unsubscribe? do
      it 'not grants access' do
        expect(subject).not_to permit(user, book)
      end
    end
  end

  context 'When book status is approved' do
    let(:user2) { FactoryGirl.create(:user) }
    permissions :show? do
      it 'grant access to normal user' do
        book.status = :approved
        expect(subject).to permit(user2, book)
      end
    end
  end
end

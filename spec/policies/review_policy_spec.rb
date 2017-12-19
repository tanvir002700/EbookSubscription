RSpec.describe ReviewPolicy do
  subject { described_class }
  let(:review) { FactoryGirl.create(:review) }

  context 'When user is admin user' do
    let(:admin) { FactoryGirl.create(:admin) }

    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'grants access' do
        expect(subject).to permit(admin, Review.new)
      end
    end
  end

  context 'When user is normal user' do
    let(:user) { FactoryGirl.create(:user) }

    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'not grants access' do
        expect(subject).not_to permit(user, Review.new)
      end
    end
  end
end

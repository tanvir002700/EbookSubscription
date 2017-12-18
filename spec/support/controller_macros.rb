module ControllerMacros
  def login_admin
    before(:each) do
      admin = FactoryGirl.create(:admin)
      sign_in admin
    end
  end

  def login_user
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
end

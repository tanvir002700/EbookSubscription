module ControllerMacros
  def login_user
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def login_admin
    before(:each) do
      user = FactoryGirl.create(:admin)
      sign_in user
    end
  end
end


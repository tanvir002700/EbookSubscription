Capybara.asset_host = 'http://localhost:3000'
RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Warden::Test::Helpers
end

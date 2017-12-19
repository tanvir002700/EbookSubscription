RSpec.describe PdfUploader do
  include CarrierWave::Test::Matchers

  let(:user) { FactoryGirl.create(:user) }
  let(:uploader) { PdfUploader.new(user, :pdf) }

  before do
    File.open('spec/support/files/clean_code.pdf') { |f| uploader.store!(f) }
  end

  after do
    uploader.remove!
  end

  it 'has correct format' do
    expect(uploader).to be_format('PBM')
  end
end

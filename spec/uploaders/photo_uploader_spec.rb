RSpec.describe PhotoUploader do
  include CarrierWave::Test::Matchers

  let(:user) { FactoryGirl.create(:user) }
  let(:uploader) { PhotoUploader.new(user, :avatar) }

  before do
    PhotoUploader.enable_processing = true
    File.open('spec/support/files/test-avatar.png') { |f| uploader.store!(f) }
  end

  after do
    PhotoUploader.enable_processing = false
    uploader.remove!
  end

  context 'the thumb version' do
    it 'scales down a landscape image to be exactly 64 by 64 pixels' do
      expect(uploader.thumb).to have_dimensions(50, 50)
    end
  end

  context 'the small version' do
    it 'scales down a landscape image to be exactly 200 by 200 pixels' do
      expect(uploader.small).to have_dimensions(200, 200)
    end
  end

  context 'the large version' do
    it 'scales down a landscape image to be exactly 400 by 400 pixels' do
      expect(uploader.medium).to have_dimensions(400, 400)
    end
  end

  it 'has correct format' do
    expect(uploader).to be_format('png')
  end
end


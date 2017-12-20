FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyText"
    status :pending
    #icover_photo File.open('spec/support/files/test-avatar.png') { |f| uploader.store!(f) }
    cover_photo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'test-avatar.png'), 'image/jpeg') }
    pdf { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'clean_code.pdf')) }
  end
end

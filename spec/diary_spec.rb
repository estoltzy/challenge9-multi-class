require 'diary'

RSpec.describe 'diary method' do
  it 'adds a phone number and lists them' do
    diary = Diary.new
    diary.add_phone_numbers("02077367699")
    expect(diary.phone_numbers).to eq ["02077367699"]
  end
end
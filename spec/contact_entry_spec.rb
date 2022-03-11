require 'contact_entry'

RSpec.describe 'contact entry method' do
  it 'returns the contact information' do
    new_contact = ContactEntry.new("Eleanor - 02077367699")
    expect(new_contact.contact).to eq "Eleanor - 02077367699"
  end
end
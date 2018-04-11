require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :user_id => 2,
      :first_name => "First Name",
      :last_name => "Last Name",
      :middle_name => "Middle Name",
      :preferred_name => "Preferred Name",
      :email => "Email",
      :primary_phone => "Primary Phone",
      :secondary_phone => "Secondary Phone",
      :text_messages => false,
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip_code => "Zip Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Preferred Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Primary Phone/)
    expect(rendered).to match(/Secondary Phone/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip Code/)
  end
end

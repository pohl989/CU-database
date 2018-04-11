require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
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
      ),
      Contact.create!(
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
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Primary Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Secondary Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :user_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :preferred_name => "MyString",
      :email => "MyString",
      :primary_phone => "MyString",
      :secondary_phone => "MyString",
      :text_messages => false,
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[user_id]"

      assert_select "input[name=?]", "contact[first_name]"

      assert_select "input[name=?]", "contact[last_name]"

      assert_select "input[name=?]", "contact[middle_name]"

      assert_select "input[name=?]", "contact[preferred_name]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[primary_phone]"

      assert_select "input[name=?]", "contact[secondary_phone]"

      assert_select "input[name=?]", "contact[text_messages]"

      assert_select "input[name=?]", "contact[street_address]"

      assert_select "input[name=?]", "contact[city]"

      assert_select "input[name=?]", "contact[state]"

      assert_select "input[name=?]", "contact[zip_code]"
    end
  end
end

require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :preferred_name => "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[first_name]"

      assert_select "input[name=?]", "client[middle_name]"

      assert_select "input[name=?]", "client[last_name]"

      assert_select "input[name=?]", "client[preferred_name]"
    end
  end
end

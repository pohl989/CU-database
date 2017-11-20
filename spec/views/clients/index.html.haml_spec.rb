require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :preferred_name => "Preferred Name"
      ),
      Client.create!(
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :preferred_name => "Preferred Name"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Name".to_s, :count => 2
  end
end

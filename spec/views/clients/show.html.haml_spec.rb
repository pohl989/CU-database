require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :last_name => "Last Name",
      :preferred_name => "Preferred Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Preferred Name/)
  end
end

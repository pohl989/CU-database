require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :length => 1.5,
      :location_id => 1
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[title]"

      assert_select "input[name=?]", "event[length]"

      assert_select "input[name=?]", "event[location_id]"
    end
  end
end

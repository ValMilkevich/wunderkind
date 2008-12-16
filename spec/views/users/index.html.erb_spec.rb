require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :id => 1,
        :full_name => "value for full_name"
      ),
      stub_model(User,
        :id => 1,
        :full_name => "value for full_name"
      )
    ]
  end

  it "should render list of users" do
    render "/users/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for full_name".to_s, 2)
  end
end


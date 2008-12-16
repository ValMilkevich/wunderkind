require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/index.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    assigns[:memberships] = [
      stub_model(Membership,
        :user_id => 1,
        :group_id => 1
      ),
      stub_model(Membership,
        :user_id => 1,
        :group_id => 1
      )
    ]
  end

  it "should render list of memberships" do
    render "/memberships/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


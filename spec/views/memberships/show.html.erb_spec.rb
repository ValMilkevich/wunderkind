require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/show.html.erb" do
  include MembershipsHelper
  before(:each) do
    assigns[:membership] = @membership = stub_model(Membership,
      :user_id => 1,
      :group_id => 1
    )
  end

  it "should render attributes in <p>" do
    render "/memberships/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/new.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    assigns[:membership] = stub_model(Membership,
      :new_record? => true,
      :user_id => 1,
      :group_id => 1
    )
  end

  it "should render new form" do
    render "/memberships/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", memberships_path) do
      with_tag("input#membership_user_id[name=?]", "membership[user_id]")
      with_tag("input#membership_group_id[name=?]", "membership[group_id]")
    end
  end
end



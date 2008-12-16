require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/edit.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    assigns[:membership] = @membership = stub_model(Membership,
      :new_record? => false,
      :user_id => 1,
      :group_id => 1
    )
  end

  it "should render edit form" do
    render "/memberships/edit.html.erb"
    
    response.should have_tag("form[action=#{membership_path(@membership)}][method=post]") do
      with_tag('input#membership_user_id[name=?]', "membership[user_id]")
      with_tag('input#membership_group_id[name=?]', "membership[group_id]")
    end
  end
end



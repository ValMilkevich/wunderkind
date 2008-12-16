require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :id => 1,
      :full_name => "value for full_name"
    )
  end

  it "should render new form" do
    render "/users/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_id[name=?]", "user[id]")
      with_tag("input#user_full_name[name=?]", "user[full_name]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/edit.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :id => 1,
      :full_name => "value for full_name"
    )
  end

  it "should render edit form" do
    render "/users/edit.html.erb"
    
    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_id[name=?]', "user[id]")
      with_tag('input#user_full_name[name=?]', "user[full_name]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/new.html.erb" do
  include GroupsHelper
  
  before(:each) do
    assigns[:group] = stub_model(Group,
      :new_record? => true,
      :author_id => 1,
      :category_id => 1,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render new form" do
    render "/groups/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", groups_path) do
      with_tag("input#group_author_id[name=?]", "group[author_id]")
      with_tag("input#group_category_id[name=?]", "group[category_id]")
      with_tag("input#group_name[name=?]", "group[name]")
      with_tag("input#group_description[name=?]", "group[description]")
    end
  end
end



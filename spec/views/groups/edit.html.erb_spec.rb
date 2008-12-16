require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/edit.html.erb" do
  include GroupsHelper
  
  before(:each) do
    assigns[:group] = @group = stub_model(Group,
      :new_record? => false,
      :author_id => 1,
      :category_id => 1,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render edit form" do
    render "/groups/edit.html.erb"
    
    response.should have_tag("form[action=#{group_path(@group)}][method=post]") do
      with_tag('input#group_author_id[name=?]', "group[author_id]")
      with_tag('input#group_category_id[name=?]', "group[category_id]")
      with_tag('input#group_name[name=?]', "group[name]")
      with_tag('input#group_description[name=?]', "group[description]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/edit.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    assigns[:category] = @category = stub_model(Category,
      :new_record? => false,
      :parent_id => 1,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/categories/edit.html.erb"
    
    response.should have_tag("form[action=#{category_path(@category)}][method=post]") do
      with_tag('input#category_parent_id[name=?]', "category[parent_id]")
      with_tag('input#category_name[name=?]', "category[name]")
    end
  end
end



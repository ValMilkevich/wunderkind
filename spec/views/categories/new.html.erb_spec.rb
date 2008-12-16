require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/new.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    assigns[:category] = stub_model(Category,
      :new_record? => true,
      :parent_id => 1,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/categories/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", categories_path) do
      with_tag("input#category_parent_id[name=?]", "category[parent_id]")
      with_tag("input#category_name[name=?]", "category[name]")
    end
  end
end



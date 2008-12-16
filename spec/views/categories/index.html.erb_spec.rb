require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/index.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    assigns[:categories] = [
      stub_model(Category,
        :parent_id => 1,
        :name => "value for name"
      ),
      stub_model(Category,
        :parent_id => 1,
        :name => "value for name"
      )
    ]
  end

  it "should render list of categories" do
    render "/categories/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end


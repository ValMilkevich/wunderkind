require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/show.html.erb" do
  include CategoriesHelper
  before(:each) do
    assigns[:category] = @category = stub_model(Category,
      :parent_id => 1,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/categories/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
  end
end


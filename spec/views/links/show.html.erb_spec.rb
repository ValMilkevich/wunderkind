require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/show.html.erb" do
  include LinksHelper
  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :linkable_id => 1,
      :linkable_type => 1,
      :source => "value for source",
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/links/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ source/)
    response.should have_text(/value\ for\ name/)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/index.html.erb" do
  include LinksHelper
  
  before(:each) do
    assigns[:links] = [
      stub_model(Link,
        :linkable_id => 1,
        :linkable_type => 1,
        :source => "value for source",
        :name => "value for name"
      ),
      stub_model(Link,
        :linkable_id => 1,
        :linkable_type => 1,
        :source => "value for source",
        :name => "value for name"
      )
    ]
  end

  it "should render list of links" do
    render "/links/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for source".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end


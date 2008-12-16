require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/new.html.erb" do
  include LinksHelper
  
  before(:each) do
    assigns[:link] = stub_model(Link,
      :new_record? => true,
      :linkable_id => 1,
      :linkable_type => 1,
      :source => "value for source",
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/links/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", links_path) do
      with_tag("input#link_linkable_id[name=?]", "link[linkable_id]")
      with_tag("input#link_linkable_type[name=?]", "link[linkable_type]")
      with_tag("input#link_source[name=?]", "link[source]")
      with_tag("input#link_name[name=?]", "link[name]")
    end
  end
end



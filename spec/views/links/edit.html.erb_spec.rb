require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/edit.html.erb" do
  include LinksHelper
  
  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :new_record? => false,
      :linkable_id => 1,
      :linkable_type => 1,
      :source => "value for source",
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/links/edit.html.erb"
    
    response.should have_tag("form[action=#{link_path(@link)}][method=post]") do
      with_tag('input#link_linkable_id[name=?]', "link[linkable_id]")
      with_tag('input#link_linkable_type[name=?]', "link[linkable_type]")
      with_tag('input#link_source[name=?]', "link[source]")
      with_tag('input#link_name[name=?]', "link[name]")
    end
  end
end



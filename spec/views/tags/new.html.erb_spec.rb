require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/new.html.erb" do
  include TagsHelper
  
  before(:each) do
    assigns[:tag] = stub_model(Tag,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/tags/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", tags_path) do
      with_tag("input#tag_name[name=?]", "tag[name]")
    end
  end
end



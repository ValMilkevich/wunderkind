require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/index.html.erb" do
  include TagsHelper
  
  before(:each) do
    assigns[:tags] = [
      stub_model(Tag,
        :name => "value for name"
      ),
      stub_model(Tag,
        :name => "value for name"
      )
    ]
  end

  it "should render list of tags" do
    render "/tags/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end


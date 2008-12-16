require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/show.html.erb" do
  include TagsHelper
  before(:each) do
    assigns[:tag] = @tag = stub_model(Tag,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/tags/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end


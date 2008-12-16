require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folders/show.html.erb" do
  include FoldersHelper
  before(:each) do
    assigns[:folder] = @folder = stub_model(Folder,
      :parent_id => 1,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/folders/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
  end
end


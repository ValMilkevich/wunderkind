require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folders/index.html.erb" do
  include FoldersHelper
  
  before(:each) do
    assigns[:folders] = [
      stub_model(Folder,
        :parent_id => 1,
        :name => "value for name"
      ),
      stub_model(Folder,
        :parent_id => 1,
        :name => "value for name"
      )
    ]
  end

  it "should render list of folders" do
    render "/folders/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end


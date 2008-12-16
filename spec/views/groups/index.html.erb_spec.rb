require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/index.html.erb" do
  include GroupsHelper
  
  before(:each) do
    assigns[:groups] = [
      stub_model(Group,
        :author_id => 1,
        :category_id => 1,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(Group,
        :author_id => 1,
        :category_id => 1,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "should render list of groups" do
    render "/groups/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end


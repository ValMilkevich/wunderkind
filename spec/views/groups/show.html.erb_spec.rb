require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/show.html.erb" do
  include GroupsHelper
  before(:each) do
    assigns[:group] = @group = stub_model(Group,
      :author_id => 1,
      :category_id => 1,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render attributes in <p>" do
    render "/groups/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end


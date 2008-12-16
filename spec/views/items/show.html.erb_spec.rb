require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/show.html.erb" do
  include ItemsHelper
  before(:each) do
    assigns[:item] = @item = stub_model(Item,
      :category_id => 1,
      :folder_id => 1,
      :author_id => 1,
      :subj => "value for subj",
      :body => "value for body",
      :description => "value for description",
      :location => "value for location"
    )
  end

  it "should render attributes in <p>" do
    render "/items/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ subj/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ location/)
  end
end


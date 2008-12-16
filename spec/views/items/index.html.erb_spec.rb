require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/index.html.erb" do
  include ItemsHelper
  
  before(:each) do
    assigns[:items] = [
      stub_model(Item,
        :category_id => 1,
        :folder_id => 1,
        :author_id => 1,
        :subj => "value for subj",
        :body => "value for body",
        :description => "value for description",
        :location => "value for location"
      ),
      stub_model(Item,
        :category_id => 1,
        :folder_id => 1,
        :author_id => 1,
        :subj => "value for subj",
        :body => "value for body",
        :description => "value for description",
        :location => "value for location"
      )
    ]
  end

  it "should render list of items" do
    render "/items/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for subj".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for location".to_s, 2)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/favorites/index.html.erb" do
  include FavoritesHelper
  
  before(:each) do
    assigns[:favorites] = [
      stub_model(Favorite,
        :user_id => 1,
        :favoritable_id => 1,
        :favoritable_type => 1
      ),
      stub_model(Favorite,
        :user_id => 1,
        :favoritable_id => 1,
        :favoritable_type => 1
      )
    ]
  end

  it "should render list of favorites" do
    render "/favorites/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


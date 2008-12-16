require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/favorites/show.html.erb" do
  include FavoritesHelper
  before(:each) do
    assigns[:favorite] = @favorite = stub_model(Favorite,
      :user_id => 1,
      :favoritable_id => 1,
      :favoritable_type => 1
    )
  end

  it "should render attributes in <p>" do
    render "/favorites/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end


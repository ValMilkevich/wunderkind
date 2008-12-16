require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/favorites/edit.html.erb" do
  include FavoritesHelper
  
  before(:each) do
    assigns[:favorite] = @favorite = stub_model(Favorite,
      :new_record? => false,
      :user_id => 1,
      :favoritable_id => 1,
      :favoritable_type => 1
    )
  end

  it "should render edit form" do
    render "/favorites/edit.html.erb"
    
    response.should have_tag("form[action=#{favorite_path(@favorite)}][method=post]") do
      with_tag('input#favorite_user_id[name=?]', "favorite[user_id]")
      with_tag('input#favorite_favoritable_id[name=?]', "favorite[favoritable_id]")
      with_tag('input#favorite_favoritable_type[name=?]', "favorite[favoritable_type]")
    end
  end
end



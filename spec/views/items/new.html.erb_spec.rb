require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/new.html.erb" do
  include ItemsHelper
  
  before(:each) do
    assigns[:item] = stub_model(Item,
      :new_record? => true,
      :category_id => 1,
      :folder_id => 1,
      :author_id => 1,
      :subj => "value for subj",
      :body => "value for body",
      :description => "value for description",
      :location => "value for location"
    )
  end

  it "should render new form" do
    render "/items/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", items_path) do
      with_tag("input#item_category_id[name=?]", "item[category_id]")
      with_tag("input#item_folder_id[name=?]", "item[folder_id]")
      with_tag("input#item_author_id[name=?]", "item[author_id]")
      with_tag("input#item_subj[name=?]", "item[subj]")
      with_tag("textarea#item_body[name=?]", "item[body]")
      with_tag("textarea#item_description[name=?]", "item[description]")
      with_tag("input#item_location[name=?]", "item[location]")
    end
  end
end



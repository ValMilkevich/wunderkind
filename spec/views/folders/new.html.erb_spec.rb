require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folders/new.html.erb" do
  include FoldersHelper
  
  before(:each) do
    assigns[:folder] = stub_model(Folder,
      :new_record? => true,
      :parent_id => 1,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/folders/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", folders_path) do
      with_tag("input#folder_parent_id[name=?]", "folder[parent_id]")
      with_tag("input#folder_name[name=?]", "folder[name]")
    end
  end
end



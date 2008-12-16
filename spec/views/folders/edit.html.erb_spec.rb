require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folders/edit.html.erb" do
  include FoldersHelper
  
  before(:each) do
    assigns[:folder] = @folder = stub_model(Folder,
      :new_record? => false,
      :parent_id => 1,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/folders/edit.html.erb"
    
    response.should have_tag("form[action=#{folder_path(@folder)}][method=post]") do
      with_tag('input#folder_parent_id[name=?]', "folder[parent_id]")
      with_tag('input#folder_name[name=?]', "folder[name]")
    end
  end
end



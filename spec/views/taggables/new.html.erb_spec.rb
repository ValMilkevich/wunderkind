require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/taggables/new.html.erb" do
  include TaggablesHelper
  
  before(:each) do
    assigns[:taggable] = stub_model(Taggable,
      :new_record? => true,
      :tag_id => 1,
      :taggable_id => 1,
      :taggable_type => "value for taggable_type"
    )
  end

  it "should render new form" do
    render "/taggables/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", taggables_path) do
      with_tag("input#taggable_tag_id[name=?]", "taggable[tag_id]")
      with_tag("input#taggable_taggable_id[name=?]", "taggable[taggable_id]")
      with_tag("input#taggable_taggable_type[name=?]", "taggable[taggable_type]")
    end
  end
end



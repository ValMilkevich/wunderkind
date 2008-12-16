require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/taggables/index.html.erb" do
  include TaggablesHelper
  
  before(:each) do
    assigns[:taggables] = [
      stub_model(Taggable,
        :tag_id => 1,
        :taggable_id => 1,
        :taggable_type => "value for taggable_type"
      ),
      stub_model(Taggable,
        :tag_id => 1,
        :taggable_id => 1,
        :taggable_type => "value for taggable_type"
      )
    ]
  end

  it "should render list of taggables" do
    render "/taggables/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for taggable_type".to_s, 2)
  end
end


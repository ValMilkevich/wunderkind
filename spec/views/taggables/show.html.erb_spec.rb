require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/taggables/show.html.erb" do
  include TaggablesHelper
  before(:each) do
    assigns[:taggable] = @taggable = stub_model(Taggable,
      :tag_id => 1,
      :taggable_id => 1,
      :taggable_type => "value for taggable_type"
    )
  end

  it "should render attributes in <p>" do
    render "/taggables/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ taggable_type/)
  end
end


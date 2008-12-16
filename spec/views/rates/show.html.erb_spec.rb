require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rates/show.html.erb" do
  include RatesHelper
  before(:each) do
    assigns[:rate] = @rate = stub_model(Rate,
      :ratable_id => 1,
      :ratable_type => "value for ratable_type",
      :value => 1,
      :notes => "value for notes"
    )
  end

  it "should render attributes in <p>" do
    render "/rates/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/value\ for\ ratable_type/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ notes/)
  end
end


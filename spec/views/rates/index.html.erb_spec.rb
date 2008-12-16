require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rates/index.html.erb" do
  include RatesHelper
  
  before(:each) do
    assigns[:rates] = [
      stub_model(Rate,
        :ratable_id => 1,
        :ratable_type => "value for ratable_type",
        :value => 1,
        :notes => "value for notes"
      ),
      stub_model(Rate,
        :ratable_id => 1,
        :ratable_type => "value for ratable_type",
        :value => 1,
        :notes => "value for notes"
      )
    ]
  end

  it "should render list of rates" do
    render "/rates/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for ratable_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end


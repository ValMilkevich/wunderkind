require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rates/new.html.erb" do
  include RatesHelper
  
  before(:each) do
    assigns[:rate] = stub_model(Rate,
      :new_record? => true,
      :ratable_id => 1,
      :ratable_type => "value for ratable_type",
      :value => 1,
      :notes => "value for notes"
    )
  end

  it "should render new form" do
    render "/rates/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", rates_path) do
      with_tag("input#rate_ratable_id[name=?]", "rate[ratable_id]")
      with_tag("input#rate_ratable_type[name=?]", "rate[ratable_type]")
      with_tag("input#rate_value[name=?]", "rate[value]")
      with_tag("input#rate_notes[name=?]", "rate[notes]")
    end
  end
end



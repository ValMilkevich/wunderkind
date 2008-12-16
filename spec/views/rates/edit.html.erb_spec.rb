require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rates/edit.html.erb" do
  include RatesHelper
  
  before(:each) do
    assigns[:rate] = @rate = stub_model(Rate,
      :new_record? => false,
      :ratable_id => 1,
      :ratable_type => "value for ratable_type",
      :value => 1,
      :notes => "value for notes"
    )
  end

  it "should render edit form" do
    render "/rates/edit.html.erb"
    
    response.should have_tag("form[action=#{rate_path(@rate)}][method=post]") do
      with_tag('input#rate_ratable_id[name=?]', "rate[ratable_id]")
      with_tag('input#rate_ratable_type[name=?]', "rate[ratable_type]")
      with_tag('input#rate_value[name=?]', "rate[value]")
      with_tag('input#rate_notes[name=?]', "rate[notes]")
    end
  end
end



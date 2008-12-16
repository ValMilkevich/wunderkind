require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Rate do
  before(:each) do
    @valid_attributes = {
      :ratable_id => 1,
      :ratable_type => "value for ratable_type",
      :value => 1,
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Rate.create!(@valid_attributes)
  end
end

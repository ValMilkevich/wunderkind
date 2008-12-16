require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Taggable do
  before(:each) do
    @taggable = Taggable.new(valid_hash)
  end

  it "should create a new instance given valid attributes" do
    Taggable.create!(@valid_attributes)
  end
  
  private
  def valid_hash
    {
      :tag_id => 1,
      :taggable_id => 1,
      :taggable_type => "value for taggable_type"
    }
  end
end

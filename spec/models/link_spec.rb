require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Link do
  before(:each) do
    @link = Link.new(valid_hash)
  end

  it "should create a new instance given valid attributes" do
    Link.create!(valid_hash)
  end
  
  private
  def valid_hash
    {
      :linkable_id => 1,
      :linkable_type => 1,
      :source => "value for source",
      :name => "value for name"
    }
  end
end

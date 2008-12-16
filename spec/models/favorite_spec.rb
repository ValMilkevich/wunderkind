require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Favorite do
  before(:each) do
    @favorite = Favorite.new(valid_hash)
    @owner = mock_model(User)
  end

  it "should create a new instance given valid attributes" do
    Favorite.create!(valid_hash)
  end
  
  it "should have user" do
    @favorite.save
    @favorite.user = @owner
    @favorite.user.should be_instance_of(User)
    @favorite.user.should eql(@owner)
  end
  
  private
  def valid_hash
    {
      :user_id => 1,
      :favoritable_id => 1,
      :favoritable_type => 1
    }
  end
end

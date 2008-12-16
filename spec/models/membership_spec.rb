require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Membership do
  before(:each) do
    @membership = Membership.new(valid_hash)
    @user = mock_model(User)
    @group= mock_model(Group)
  end

  it "should create a new instance given valid attributes" do
    Membership.create!(@valid_attributes)
  end
  
  it "should have user" do
    @membership.user = @user
    @membership.user.should eql(@user)
  end
  
  it "should have group" do
    @membership.group = @group
    @membership.group.should eql(@group)
  end
  
  private
  def valid_hash
    {
      :user_id => 1,
      :group_id => 1
    }
  end
end

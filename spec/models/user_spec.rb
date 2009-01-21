require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @user = User.new(valid_post_hash)
  end

  it "should create a new instance given valid attributes" do
    @user.save!.should == true
  end
  
  it "should have posts" do
    @user.save
    @user.posts.should be_instance_of(Array)
  end
  
  it "can have favorites" do
    @user.save
    @user.favorites.should be_instance_of(Array)
  end
  
  it "can be in a group through  memberships" do
    @user.save
    @user.subscribed_groups.should be_instance_of(Array)
  end
  
  it "can have created_groups" do
    @user.save
    @user.created_groups.should be_instance_of(Array)
  end

  def valid_post_hash
    {
      :full_name => "value for full_name"
    }
  end
  
end

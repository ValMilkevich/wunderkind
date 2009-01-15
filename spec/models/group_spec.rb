require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Group do
  before(:each) do
    @group = Group.new(valid_hash)
  end

  it "should create a new instance given valid attributes" do
    Group.create!(valid_hash)
  end
  
  it "should have subscribed users" do
    @group.save
    @group.subscribed_users = User.create(:full_name=>'Valentine Milkevich')
    @group.subscribed_users.should be_instance_of(Array)
  end

  
  private
  def valid_hash
    {
      :author_id => 1,
      :category_id => 1,
      :name => "value for name",
      :description => "value for description"
    }
  end
end

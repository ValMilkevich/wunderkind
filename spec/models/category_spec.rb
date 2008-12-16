require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Category do
  before(:each) do
    @category = Category.new(valid_hash)
    @category2= mock_model(Category)
  end

  it "should create a new instance given valid attributes" do
    Category.create!(valid_hash)
  end
  
  it "shoud have folders" do
    @category.save
    @category.folders.should be_instance_of(Array)
  end
  
  it "should have posts" do
    @category.save
    @category.posts.should be_instance_of(Array)
  end
  
  it "should have items" do
    @category.save
    @category.items.should be_instance_of(Array)
  end
  
  it "should have parent" do
    @category.save
    @category.parent = @category2
    @category.parent.should be_instance_of(Category)
  end
  
  it "should have children" do
    @category.save
    @category.children.should be_instance_of(Array)
  end
  
  private
  def valid_hash
    {
      :parent_id => 1,
      :name => "value for name"
    }
  end
end

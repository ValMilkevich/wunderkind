require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Folder do
  before(:each) do
    @folder = Folder.new(valid_hash)
    @folder2= mock_model(Folder)
    @category=mock_model(Category)
  end
  
  it "should create a new instance given valid attributes" do
    Folder.create!(valid_hash)
  end
  
  it "should have category" do
    @folder.save
    @folder.category = @category
    @folder.category.should eql(@category)
  end
  
  it "should have parent" do
    @folder.save
    @folder.parent = @folder2
    @folder.parent.should be_instance_of(Folder)
  end
  
  it "should have children" do
    @folder.save
    @folder.children.should be_instance_of(Array)
  end
  
  
  private
  def valid_hash
    {
      :parent_id => 1,
      :name => "value for name"
    }
  end
end

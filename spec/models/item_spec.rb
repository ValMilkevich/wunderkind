require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Item do
  before(:each) do
    @item = Item.new(valid_hash)
    @folder = mock_model(Folder)
    @category=mock_model(Category)
    @author = mock_model(User)
  end

  it "should create a new instance given valid attributes" do
    Item.create!(valid_hash)
  end
  
  it "should have folder" do
    @item.save
    @item.folder = @folder
    @item.folder.should eql(@folder)    
  end
  
  it "should have category" do
    @item.save
    @item.category = @category
    @item.category.should eql(@category)
  end
  
  it "should have author" do
    @item.save
    @item.author = @author
    @item.author.should eql(@author)
  end
  
  private
  def valid_hash
    {
      :category_id => 1,
      :folder_id => 1,
      :author_id => 1,
      :subj => "value for subj",
      :body => "value for body",
      :description => "value for description",
      :location => "value for location"
    }
  end
end

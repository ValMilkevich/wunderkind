require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  before(:each) do
  
    @post = Post.new(valid_post_hash)
    
    @author = mock_model(User)    
    @post.author = @author
    
    @folder = mock_model(Folder)
    @post.folder = @folder
    
    @status = mock_model(Status)
    @post.status = @status
    
    @category = mock_model(Category)
    @post.category = @category
    
  end

  it "should create a new instance given valid attributes" do    
    @post.save!.should == true
  end
  
  it "should have author" do
    @post.author.should eql(@author)
  end
  
  it "should have folder" do
    @post.folder.should eql(@folder)
  end
  
  it "should have status" do
    @post.status.should eql(@status)
  end
  
  it "should have category" do
    @post.category.should eql(@category)
  end
  
  it "can have links" do
    @post.links.should be_instance_of(Array)
  end
  
  it "can have comments" do
    @post.comments.should be_instance_of(Array)
  end
  
  it "can have tags" do
    @post.tags.should be_instance_of(Array)
  end
  
  it "can have answers" do
    @post.links.should be_instance_of(Array)
  end
  
  it "can have rate" do
    @post.rate.should be_instance_of(Array)
  end
  
  
  
  def valid_post_hash
    {
      :review => "value for review",
      :subject => "value for subject",
      :body => "value for body",
      :image => "value for image",
    }
  end
end

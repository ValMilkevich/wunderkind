require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Answer do
  before(:each) do
    @answer = Post.new(valid_hash)
    
    @post = mock_model(Post)
  end

  it "should create a new instance given valid attributes" do
    Answer.create!(valid_hash)
  end
  
  it "should have post" do
    @answer.save
    @answer.post = @post
    @answer.should be_instance_of(Post)
    @answer.should eql(@post)
  end
  
  private
  def valid_hash
    {
      :post_id => 1,
      :body => "value for body"
    }
  end
end

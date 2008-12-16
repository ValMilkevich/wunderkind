require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
    @comment = Comment.new(valid_hash)
   
    @author = mock_model(User)
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(valid_hash)
  end
  
  it "should have author" do
    @comment.author = @author
    
    @comment.author.should be_instance_of(User)
    @comment.author.sholud eql(@author)
  end
  
  private
  def valid_hash
    {
      :author_id => 1,
      :commentable_id => 1,
      :commentable_type => 1,
      :sujb => "value for sujb",
      :body => "value for body"
    }
  end
end

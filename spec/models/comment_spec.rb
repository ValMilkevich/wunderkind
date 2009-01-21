require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
    @comment = Comment.new(valid_hash)
    @post = mock_model(Post)
    @author = mock_model(User)
    @comment1 = mock_model(Comment)
    @item = mock_model(Item)
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(valid_hash)
  end
  
  it "should have author" do
    @comment.author = @author
    
    @comment.author.should be_instance_of(User)
    @comment.author.should eql(@author)
  end

  it "should be able to belong to post" do
    @comment.commentable = @post
    @comment.commentable.should eql(@post)
  end

  it "should be able to belong to comment" do
    @comment.commentable = @comment1
    @comment.commentable.should eql(@comment1)
  end

  it "should be able to belong to item" do
    @comment.commentable = @item
    @comment.commentable.should eql(@item)
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Favorite do
  before(:each) do
    @favorite = Favorite.new(valid_hash)
    @owner = mock_model(User)
    @post = mock_model(Post)
    @comment = mock_model(Comment)
    @itme = mock_model(Item)
  end

  it "should create a new instance given valid attributes" do
    Favorite.create!(valid_hash)
  end
  
  it "should have user" do
    @favorite.save
    @favorite.user = @owner
    @favorite.user.should be_instance_of(User)
    @favorite.user.should eql(@owner)
  end

  it "should be able to contain comments" do
    @favorite.favoritable = @comments
    @favorite.favoritable.should eql(@comments)
  end

  it "should be able to contain posts" do
    @favorite.favoritable = @post
    @favorite.favoritable.should eql(@post)
  end

  it "should be able to contain items" do
    @favorite.favoritable = @items
    @favorite.favoritable.should eql(@items)
  end

  private
  def valid_hash
    {
      :user_id => 1,
      :favoritable_id => 1,
      :favoritable_type => 1
    }
  end
end

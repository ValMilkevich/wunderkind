require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Answer do
  before(:each) do
    @answer = Answer.new(valid_hash)
    
    @post = mock_model(Post)
  end

  it "should create a new instance given valid attributes" do
    Answer.create!(valid_hash)
  end
  
  it "should have post" do
    @answer.save
    @answer.post = @post
    @answer.should be_instance_of(Answer)
    @answer.should eql(@post)
  end
  
  private
  def valid_hash
    {
      :body => "value for body"
    }
  end
end 

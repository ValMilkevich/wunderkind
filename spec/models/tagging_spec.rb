require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tagging do
  before(:each) do
    @valid_attributes = {
      :tag_id=>1, :taggable_type=>'Post', :taggable_id=>1
    }
    @tagging = Tagging.new(@valid_attributes)
  end

  it "should have tag" do
    @tagging.save
    @tag = mock_model(Tag)
    @tagging.tag = @tag
    @tagging.tag.should be_instance_of(Tag)
  end

  it "should be able to tag Post, Item" do
    @post = mock_model(Post)
    @tagging.taggable = @post
    @tagging.taggable.should be_instance_of(Post)

    @item = mock_model(Item)
    @tagging.taggable = @item
    @tagging.taggable.should be_instance_of(Item)
  end

  it "should create a new instance given valid attributes" do
    @tagging.save
    Tagging.create!(@valid_attributes)
  end
end

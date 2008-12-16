require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true,
      :author_id => 1,
      :commentable_id => 1,
      :commentable_type => 1,
      :sujb => "value for sujb",
      :body => "value for body"
    )
  end

  it "should render new form" do
    render "/comments/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("input#comment_author_id[name=?]", "comment[author_id]")
      with_tag("input#comment_commentable_id[name=?]", "comment[commentable_id]")
      with_tag("input#comment_commentable_type[name=?]", "comment[commentable_type]")
      with_tag("input#comment_sujb[name=?]", "comment[sujb]")
      with_tag("input#comment_body[name=?]", "comment[body]")
    end
  end
end



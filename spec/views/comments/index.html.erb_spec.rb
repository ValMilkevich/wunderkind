require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/index.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comments] = [
      stub_model(Comment,
        :author_id => 1,
        :commentable_id => 1,
        :commentable_type => 1,
        :sujb => "value for sujb",
        :body => "value for body"
      ),
      stub_model(Comment,
        :author_id => 1,
        :commentable_id => 1,
        :commentable_type => 1,
        :sujb => "value for sujb",
        :body => "value for body"
      )
    ]
  end

  it "should render list of comments" do
    render "/comments/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for sujb".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end


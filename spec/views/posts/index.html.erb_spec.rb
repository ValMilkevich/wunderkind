require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/index.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:posts] = [
      stub_model(Post,
        :id => 1,
        :author_id => 1,
        :folder_id => 1,
        :category_id => 1,
        :status_id => 1,
        :review => "value for review",
        :subject => "value for subject",
        :body => "value for body",
        :image => "value for image",
        :views => 1
      ),
      stub_model(Post,
        :id => 1,
        :author_id => 1,
        :folder_id => 1,
        :category_id => 1,
        :status_id => 1,
        :review => "value for review",
        :subject => "value for subject",
        :body => "value for body",
        :image => "value for image",
        :views => 1
      )
    ]
  end

  it "should render list of posts" do
    render "/posts/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for review".to_s, 2)
    response.should have_tag("tr>td", "value for subject".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", "value for image".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


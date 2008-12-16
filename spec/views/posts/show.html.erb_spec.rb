require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/show.html.erb" do
  include PostsHelper
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
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
  end

  it "should render attributes in <p>" do
    render "/posts/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ review/)
    response.should have_text(/value\ for\ subject/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/value\ for\ image/)
    response.should have_text(/1/)
  end
end


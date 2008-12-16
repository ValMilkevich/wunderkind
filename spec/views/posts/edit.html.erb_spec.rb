require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/edit.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :new_record? => false,
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

  it "should render edit form" do
    render "/posts/edit.html.erb"
    
    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
      with_tag('input#post_id[name=?]', "post[id]")
      with_tag('input#post_author_id[name=?]', "post[author_id]")
      with_tag('input#post_folder_id[name=?]', "post[folder_id]")
      with_tag('input#post_category_id[name=?]', "post[category_id]")
      with_tag('input#post_status_id[name=?]', "post[status_id]")
      with_tag('textarea#post_review[name=?]', "post[review]")
      with_tag('input#post_subject[name=?]', "post[subject]")
      with_tag('textarea#post_body[name=?]', "post[body]")
      with_tag('input#post_image[name=?]', "post[image]")
      with_tag('input#post_views[name=?]', "post[views]")
    end
  end
end



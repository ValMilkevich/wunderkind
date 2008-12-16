require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/answers/new.html.erb" do
  include AnswersHelper
  
  before(:each) do
    assigns[:answer] = stub_model(Answer,
      :new_record? => true,
      :post_id => 1,
      :body => "value for body"
    )
  end

  it "should render new form" do
    render "/answers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", answers_path) do
      with_tag("input#answer_post_id[name=?]", "answer[post_id]")
      with_tag("input#answer_body[name=?]", "answer[body]")
    end
  end
end



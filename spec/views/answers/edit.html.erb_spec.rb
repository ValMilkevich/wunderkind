require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/answers/edit.html.erb" do
  include AnswersHelper
  
  before(:each) do
    assigns[:answer] = @answer = stub_model(Answer,
      :new_record? => false,
      :post_id => 1,
      :body => "value for body"
    )
  end

  it "should render edit form" do
    render "/answers/edit.html.erb"
    
    response.should have_tag("form[action=#{answer_path(@answer)}][method=post]") do
      with_tag('input#answer_post_id[name=?]', "answer[post_id]")
      with_tag('input#answer_body[name=?]', "answer[body]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/answers/index.html.erb" do
  include AnswersHelper
  
  before(:each) do
    assigns[:answers] = [
      stub_model(Answer,
        :post_id => 1,
        :body => "value for body"
      ),
      stub_model(Answer,
        :post_id => 1,
        :body => "value for body"
      )
    ]
  end

  it "should render list of answers" do
    render "/answers/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end


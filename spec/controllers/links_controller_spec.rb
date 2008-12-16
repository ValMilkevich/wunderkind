require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinksController do

  def mock_link(stubs={})
    @mock_link ||= mock_model(Link, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all links as @links" do
      Link.should_receive(:find).with(:all).and_return([mock_link])
      get :index
      assigns[:links].should == [mock_link]
    end

    describe "with mime type of xml" do
  
      it "should render all links as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Link.should_receive(:find).with(:all).and_return(links = mock("Array of Links"))
        links.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested link as @link" do
      Link.should_receive(:find).with("37").and_return(mock_link)
      get :show, :id => "37"
      assigns[:link].should equal(mock_link)
    end
    
    describe "with mime type of xml" do

      it "should render the requested link as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Link.should_receive(:find).with("37").and_return(mock_link)
        mock_link.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new link as @link" do
      Link.should_receive(:new).and_return(mock_link)
      get :new
      assigns[:link].should equal(mock_link)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested link as @link" do
      Link.should_receive(:find).with("37").and_return(mock_link)
      get :edit, :id => "37"
      assigns[:link].should equal(mock_link)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created link as @link" do
        Link.should_receive(:new).with({'these' => 'params'}).and_return(mock_link(:save => true))
        post :create, :link => {:these => 'params'}
        assigns(:link).should equal(mock_link)
      end

      it "should redirect to the created link" do
        Link.stub!(:new).and_return(mock_link(:save => true))
        post :create, :link => {}
        response.should redirect_to(link_url(mock_link))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved link as @link" do
        Link.stub!(:new).with({'these' => 'params'}).and_return(mock_link(:save => false))
        post :create, :link => {:these => 'params'}
        assigns(:link).should equal(mock_link)
      end

      it "should re-render the 'new' template" do
        Link.stub!(:new).and_return(mock_link(:save => false))
        post :create, :link => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested link" do
        Link.should_receive(:find).with("37").and_return(mock_link)
        mock_link.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :link => {:these => 'params'}
      end

      it "should expose the requested link as @link" do
        Link.stub!(:find).and_return(mock_link(:update_attributes => true))
        put :update, :id => "1"
        assigns(:link).should equal(mock_link)
      end

      it "should redirect to the link" do
        Link.stub!(:find).and_return(mock_link(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(link_url(mock_link))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested link" do
        Link.should_receive(:find).with("37").and_return(mock_link)
        mock_link.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :link => {:these => 'params'}
      end

      it "should expose the link as @link" do
        Link.stub!(:find).and_return(mock_link(:update_attributes => false))
        put :update, :id => "1"
        assigns(:link).should equal(mock_link)
      end

      it "should re-render the 'edit' template" do
        Link.stub!(:find).and_return(mock_link(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested link" do
      Link.should_receive(:find).with("37").and_return(mock_link)
      mock_link.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the links list" do
      Link.stub!(:find).and_return(mock_link(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(links_url)
    end

  end

end

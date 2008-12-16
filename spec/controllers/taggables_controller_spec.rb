require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TaggablesController do

  def mock_taggable(stubs={})
    @mock_taggable ||= mock_model(Taggable, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all taggables as @taggables" do
      Taggable.should_receive(:find).with(:all).and_return([mock_taggable])
      get :index
      assigns[:taggables].should == [mock_taggable]
    end

    describe "with mime type of xml" do
  
      it "should render all taggables as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Taggable.should_receive(:find).with(:all).and_return(taggables = mock("Array of Taggables"))
        taggables.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested taggable as @taggable" do
      Taggable.should_receive(:find).with("37").and_return(mock_taggable)
      get :show, :id => "37"
      assigns[:taggable].should equal(mock_taggable)
    end
    
    describe "with mime type of xml" do

      it "should render the requested taggable as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Taggable.should_receive(:find).with("37").and_return(mock_taggable)
        mock_taggable.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new taggable as @taggable" do
      Taggable.should_receive(:new).and_return(mock_taggable)
      get :new
      assigns[:taggable].should equal(mock_taggable)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested taggable as @taggable" do
      Taggable.should_receive(:find).with("37").and_return(mock_taggable)
      get :edit, :id => "37"
      assigns[:taggable].should equal(mock_taggable)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created taggable as @taggable" do
        Taggable.should_receive(:new).with({'these' => 'params'}).and_return(mock_taggable(:save => true))
        post :create, :taggable => {:these => 'params'}
        assigns(:taggable).should equal(mock_taggable)
      end

      it "should redirect to the created taggable" do
        Taggable.stub!(:new).and_return(mock_taggable(:save => true))
        post :create, :taggable => {}
        response.should redirect_to(taggable_url(mock_taggable))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved taggable as @taggable" do
        Taggable.stub!(:new).with({'these' => 'params'}).and_return(mock_taggable(:save => false))
        post :create, :taggable => {:these => 'params'}
        assigns(:taggable).should equal(mock_taggable)
      end

      it "should re-render the 'new' template" do
        Taggable.stub!(:new).and_return(mock_taggable(:save => false))
        post :create, :taggable => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested taggable" do
        Taggable.should_receive(:find).with("37").and_return(mock_taggable)
        mock_taggable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :taggable => {:these => 'params'}
      end

      it "should expose the requested taggable as @taggable" do
        Taggable.stub!(:find).and_return(mock_taggable(:update_attributes => true))
        put :update, :id => "1"
        assigns(:taggable).should equal(mock_taggable)
      end

      it "should redirect to the taggable" do
        Taggable.stub!(:find).and_return(mock_taggable(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(taggable_url(mock_taggable))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested taggable" do
        Taggable.should_receive(:find).with("37").and_return(mock_taggable)
        mock_taggable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :taggable => {:these => 'params'}
      end

      it "should expose the taggable as @taggable" do
        Taggable.stub!(:find).and_return(mock_taggable(:update_attributes => false))
        put :update, :id => "1"
        assigns(:taggable).should equal(mock_taggable)
      end

      it "should re-render the 'edit' template" do
        Taggable.stub!(:find).and_return(mock_taggable(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested taggable" do
      Taggable.should_receive(:find).with("37").and_return(mock_taggable)
      mock_taggable.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the taggables list" do
      Taggable.stub!(:find).and_return(mock_taggable(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(taggables_url)
    end

  end

end

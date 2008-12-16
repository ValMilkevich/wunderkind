require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FoldersController do

  def mock_folder(stubs={})
    @mock_folder ||= mock_model(Folder, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all folders as @folders" do
      Folder.should_receive(:find).with(:all).and_return([mock_folder])
      get :index
      assigns[:folders].should == [mock_folder]
    end

    describe "with mime type of xml" do
  
      it "should render all folders as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Folder.should_receive(:find).with(:all).and_return(folders = mock("Array of Folders"))
        folders.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested folder as @folder" do
      Folder.should_receive(:find).with("37").and_return(mock_folder)
      get :show, :id => "37"
      assigns[:folder].should equal(mock_folder)
    end
    
    describe "with mime type of xml" do

      it "should render the requested folder as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Folder.should_receive(:find).with("37").and_return(mock_folder)
        mock_folder.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new folder as @folder" do
      Folder.should_receive(:new).and_return(mock_folder)
      get :new
      assigns[:folder].should equal(mock_folder)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested folder as @folder" do
      Folder.should_receive(:find).with("37").and_return(mock_folder)
      get :edit, :id => "37"
      assigns[:folder].should equal(mock_folder)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created folder as @folder" do
        Folder.should_receive(:new).with({'these' => 'params'}).and_return(mock_folder(:save => true))
        post :create, :folder => {:these => 'params'}
        assigns(:folder).should equal(mock_folder)
      end

      it "should redirect to the created folder" do
        Folder.stub!(:new).and_return(mock_folder(:save => true))
        post :create, :folder => {}
        response.should redirect_to(folder_url(mock_folder))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved folder as @folder" do
        Folder.stub!(:new).with({'these' => 'params'}).and_return(mock_folder(:save => false))
        post :create, :folder => {:these => 'params'}
        assigns(:folder).should equal(mock_folder)
      end

      it "should re-render the 'new' template" do
        Folder.stub!(:new).and_return(mock_folder(:save => false))
        post :create, :folder => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested folder" do
        Folder.should_receive(:find).with("37").and_return(mock_folder)
        mock_folder.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :folder => {:these => 'params'}
      end

      it "should expose the requested folder as @folder" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => true))
        put :update, :id => "1"
        assigns(:folder).should equal(mock_folder)
      end

      it "should redirect to the folder" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(folder_url(mock_folder))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested folder" do
        Folder.should_receive(:find).with("37").and_return(mock_folder)
        mock_folder.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :folder => {:these => 'params'}
      end

      it "should expose the folder as @folder" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => false))
        put :update, :id => "1"
        assigns(:folder).should equal(mock_folder)
      end

      it "should re-render the 'edit' template" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested folder" do
      Folder.should_receive(:find).with("37").and_return(mock_folder)
      mock_folder.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the folders list" do
      Folder.stub!(:find).and_return(mock_folder(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(folders_url)
    end

  end

end

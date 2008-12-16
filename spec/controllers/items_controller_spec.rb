require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemsController do

  def mock_item(stubs={})
    @mock_item ||= mock_model(Item, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all items as @items" do
      Item.should_receive(:find).with(:all).and_return([mock_item])
      get :index
      assigns[:items].should == [mock_item]
    end

    describe "with mime type of xml" do
  
      it "should render all items as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Item.should_receive(:find).with(:all).and_return(items = mock("Array of Items"))
        items.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested item as @item" do
      Item.should_receive(:find).with("37").and_return(mock_item)
      get :show, :id => "37"
      assigns[:item].should equal(mock_item)
    end
    
    describe "with mime type of xml" do

      it "should render the requested item as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Item.should_receive(:find).with("37").and_return(mock_item)
        mock_item.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new item as @item" do
      Item.should_receive(:new).and_return(mock_item)
      get :new
      assigns[:item].should equal(mock_item)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested item as @item" do
      Item.should_receive(:find).with("37").and_return(mock_item)
      get :edit, :id => "37"
      assigns[:item].should equal(mock_item)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created item as @item" do
        Item.should_receive(:new).with({'these' => 'params'}).and_return(mock_item(:save => true))
        post :create, :item => {:these => 'params'}
        assigns(:item).should equal(mock_item)
      end

      it "should redirect to the created item" do
        Item.stub!(:new).and_return(mock_item(:save => true))
        post :create, :item => {}
        response.should redirect_to(item_url(mock_item))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved item as @item" do
        Item.stub!(:new).with({'these' => 'params'}).and_return(mock_item(:save => false))
        post :create, :item => {:these => 'params'}
        assigns(:item).should equal(mock_item)
      end

      it "should re-render the 'new' template" do
        Item.stub!(:new).and_return(mock_item(:save => false))
        post :create, :item => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested item" do
        Item.should_receive(:find).with("37").and_return(mock_item)
        mock_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item => {:these => 'params'}
      end

      it "should expose the requested item as @item" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => true))
        put :update, :id => "1"
        assigns(:item).should equal(mock_item)
      end

      it "should redirect to the item" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(item_url(mock_item))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested item" do
        Item.should_receive(:find).with("37").and_return(mock_item)
        mock_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item => {:these => 'params'}
      end

      it "should expose the item as @item" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => false))
        put :update, :id => "1"
        assigns(:item).should equal(mock_item)
      end

      it "should re-render the 'edit' template" do
        Item.stub!(:find).and_return(mock_item(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested item" do
      Item.should_receive(:find).with("37").and_return(mock_item)
      mock_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the items list" do
      Item.stub!(:find).and_return(mock_item(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(items_url)
    end

  end

end

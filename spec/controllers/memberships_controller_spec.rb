require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MembershipsController do

  def mock_membership(stubs={})
    @mock_membership ||= mock_model(Membership, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all memberships as @memberships" do
      Membership.should_receive(:find).with(:all).and_return([mock_membership])
      get :index
      assigns[:memberships].should == [mock_membership]
    end

    describe "with mime type of xml" do
  
      it "should render all memberships as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Membership.should_receive(:find).with(:all).and_return(memberships = mock("Array of Memberships"))
        memberships.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested membership as @membership" do
      Membership.should_receive(:find).with("37").and_return(mock_membership)
      get :show, :id => "37"
      assigns[:membership].should equal(mock_membership)
    end
    
    describe "with mime type of xml" do

      it "should render the requested membership as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Membership.should_receive(:find).with("37").and_return(mock_membership)
        mock_membership.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new membership as @membership" do
      Membership.should_receive(:new).and_return(mock_membership)
      get :new
      assigns[:membership].should equal(mock_membership)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested membership as @membership" do
      Membership.should_receive(:find).with("37").and_return(mock_membership)
      get :edit, :id => "37"
      assigns[:membership].should equal(mock_membership)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created membership as @membership" do
        Membership.should_receive(:new).with({'these' => 'params'}).and_return(mock_membership(:save => true))
        post :create, :membership => {:these => 'params'}
        assigns(:membership).should equal(mock_membership)
      end

      it "should redirect to the created membership" do
        Membership.stub!(:new).and_return(mock_membership(:save => true))
        post :create, :membership => {}
        response.should redirect_to(membership_url(mock_membership))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved membership as @membership" do
        Membership.stub!(:new).with({'these' => 'params'}).and_return(mock_membership(:save => false))
        post :create, :membership => {:these => 'params'}
        assigns(:membership).should equal(mock_membership)
      end

      it "should re-render the 'new' template" do
        Membership.stub!(:new).and_return(mock_membership(:save => false))
        post :create, :membership => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested membership" do
        Membership.should_receive(:find).with("37").and_return(mock_membership)
        mock_membership.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :membership => {:these => 'params'}
      end

      it "should expose the requested membership as @membership" do
        Membership.stub!(:find).and_return(mock_membership(:update_attributes => true))
        put :update, :id => "1"
        assigns(:membership).should equal(mock_membership)
      end

      it "should redirect to the membership" do
        Membership.stub!(:find).and_return(mock_membership(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(membership_url(mock_membership))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested membership" do
        Membership.should_receive(:find).with("37").and_return(mock_membership)
        mock_membership.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :membership => {:these => 'params'}
      end

      it "should expose the membership as @membership" do
        Membership.stub!(:find).and_return(mock_membership(:update_attributes => false))
        put :update, :id => "1"
        assigns(:membership).should equal(mock_membership)
      end

      it "should re-render the 'edit' template" do
        Membership.stub!(:find).and_return(mock_membership(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested membership" do
      Membership.should_receive(:find).with("37").and_return(mock_membership)
      mock_membership.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the memberships list" do
      Membership.stub!(:find).and_return(mock_membership(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(memberships_url)
    end

  end

end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinksController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "links", :action => "index").should == "/links"
    end
  
    it "should map #new" do
      route_for(:controller => "links", :action => "new").should == "/links/new"
    end
  
    it "should map #show" do
      route_for(:controller => "links", :action => "show", :id => 1).should == "/links/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "links", :action => "edit", :id => 1).should == "/links/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "links", :action => "update", :id => 1).should == "/links/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "links", :action => "destroy", :id => 1).should == "/links/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/links").should == {:controller => "links", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/links/new").should == {:controller => "links", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/links").should == {:controller => "links", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/links/1").should == {:controller => "links", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/links/1/edit").should == {:controller => "links", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/links/1").should == {:controller => "links", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/links/1").should == {:controller => "links", :action => "destroy", :id => "1"}
    end
  end
end

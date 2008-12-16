require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FavoritesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "favorites", :action => "index").should == "/favorites"
    end
  
    it "should map #new" do
      route_for(:controller => "favorites", :action => "new").should == "/favorites/new"
    end
  
    it "should map #show" do
      route_for(:controller => "favorites", :action => "show", :id => 1).should == "/favorites/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "favorites", :action => "edit", :id => 1).should == "/favorites/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "favorites", :action => "update", :id => 1).should == "/favorites/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "favorites", :action => "destroy", :id => 1).should == "/favorites/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/favorites").should == {:controller => "favorites", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/favorites/new").should == {:controller => "favorites", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/favorites").should == {:controller => "favorites", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/favorites/1").should == {:controller => "favorites", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/favorites/1/edit").should == {:controller => "favorites", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/favorites/1").should == {:controller => "favorites", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/favorites/1").should == {:controller => "favorites", :action => "destroy", :id => "1"}
    end
  end
end

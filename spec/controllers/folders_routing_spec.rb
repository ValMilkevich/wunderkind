require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FoldersController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "folders", :action => "index").should == "/folders"
    end
  
    it "should map #new" do
      route_for(:controller => "folders", :action => "new").should == "/folders/new"
    end
  
    it "should map #show" do
      route_for(:controller => "folders", :action => "show", :id => 1).should == "/folders/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "folders", :action => "edit", :id => 1).should == "/folders/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "folders", :action => "update", :id => 1).should == "/folders/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "folders", :action => "destroy", :id => 1).should == "/folders/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/folders").should == {:controller => "folders", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/folders/new").should == {:controller => "folders", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/folders").should == {:controller => "folders", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/folders/1").should == {:controller => "folders", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/folders/1/edit").should == {:controller => "folders", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/folders/1").should == {:controller => "folders", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/folders/1").should == {:controller => "folders", :action => "destroy", :id => "1"}
    end
  end
end

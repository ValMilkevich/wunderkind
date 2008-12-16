require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TaggablesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "taggables", :action => "index").should == "/taggables"
    end
  
    it "should map #new" do
      route_for(:controller => "taggables", :action => "new").should == "/taggables/new"
    end
  
    it "should map #show" do
      route_for(:controller => "taggables", :action => "show", :id => 1).should == "/taggables/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "taggables", :action => "edit", :id => 1).should == "/taggables/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "taggables", :action => "update", :id => 1).should == "/taggables/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "taggables", :action => "destroy", :id => 1).should == "/taggables/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/taggables").should == {:controller => "taggables", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/taggables/new").should == {:controller => "taggables", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/taggables").should == {:controller => "taggables", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/taggables/1").should == {:controller => "taggables", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/taggables/1/edit").should == {:controller => "taggables", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/taggables/1").should == {:controller => "taggables", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/taggables/1").should == {:controller => "taggables", :action => "destroy", :id => "1"}
    end
  end
end

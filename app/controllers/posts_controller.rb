class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml

  before_filter :setup
  
  private
  def setup
    @folder = Folder.find params[:folder_id] if(!params[:folder_id].blank?)
    @category=Category.find params[:category_id] if(!params[:category_id].blank?)
    @folders= Folder.find :all
    @categories=Category.find :all
    @statuses = Status.find :all

  rescue
    render :layout=>'exceptions'
  end
  public

  def index
    if @folder
      @posts = @folder.posts.find(:all, :order=>:created_at)
    elsif @category
      @posts = @category.posts.find(:all, :order=>:created_at)
    else
      @posts = Post.find(:all, :order=>:created_at)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  rescue Exception=>e
    render :layout=>'exceptions', :text=>e.message
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  rescue Exception=>e
    render :layout=>'exceptions', :text=>e.message
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    if @folder
      @post = Post.new(:folder_id=>@folder)
    else
      @post = Post.new
    end    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  rescue Exception=>e
    render :layout=>'exceptions', :text=>e.message
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  rescue Exception=>e
    render :layout=>'exceptions', :text=>e.message
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  rescue Exception=>e
    render :layout=>'exceptions', :text=>e.message
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  rescue Exception=>e
    render :layout=>'exceptions', :text=>e.message
  end

end

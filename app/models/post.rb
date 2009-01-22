#
#      t.integer   :author_id
#      t.integer   :folder_id
#      t.integer   :category_id
#      t.integer   :status_id
#      
#      t.text      :review
#      t.string    :subject
#      t.text      :body
#      t.string    :image
#      
#      t.integer   :comments_count, :default=>0
#      t.integer   :views_count, :default=>0
#      
#      t.timestamps


class Post < ActiveRecord::Base
  belongs_to :author, :class_name=>'User'
  belongs_to :folder
  belongs_to :status
  belongs_to :category
  has_many   :answers
  has_many   :comments, :as => :commentable, :dependent => :destroy, :order => 'created_at ASC'
  has_many   :links, :as => :linkable, :dependent => :destroy, :order => 'name ASC'
  has_one :rate, :as => :ratable, :dependent => :destroy, :dependent => :destroy
   
  attr_accessor :image_url
  attr_protected :image_file_name, :image_content_type, :image_size

  validates_presence_of :author
  validates_presence_of :folder
  validates_presence_of :status
  validates_presence_of :category
  validates_presence_of :body
  validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => 'is invalid or inaccessible'


  has_attached_file :image ,
    :styles => {:thumb => "100x100#",
                :small => "150x150",
                :big   => "250x250"
              },
    #:url => "/:class/:attachment/:id/:style_:basename.:extension",
    :storage=>:filesystem

  before_validation :download_remote_image, :if => :image_url_provided?


  private

  def image_url_provided?
    !self.image_url.blank?
  end

  def download_remote_image
    self.image = do_download_remote_image
    self.image_remote_url = image_url
  end

  def do_download_remote_image
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
  rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end
  public
  
  def viewed!
    views_count+=1
    save
  end
  
  def tags
    Tagging.find(:all, :conditions=>{:taggable_type=>'Picture', :taggable_id=>self.id},:include=>:tag).collect{|e| e.tag}
  end
  
end

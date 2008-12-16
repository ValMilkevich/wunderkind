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
  
  
  validates_presence_of :author
  validates_presence_of :folder
  validates_presence_of :status
  validates_presence_of :category
  validates_presence_of :body
  
  
  def viewed!
    views_count+=1
    save
  end
  
  
end

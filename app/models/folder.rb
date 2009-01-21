class Folder < ActiveRecord::Base
  acts_as_tree :order=>:name
  belongs_to :category

  has_many :posts
end

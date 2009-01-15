class Category < ActiveRecord::Base
acts_as_tree :order=>:name

has_many :items
has_many :posts
has_many :folders


end

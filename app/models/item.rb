class Item < ActiveRecord::Base
belongs_to :author, :class_name=>"User"
belongs_to :category
belongs_to :folder

end

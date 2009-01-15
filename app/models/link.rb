class Link < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true, :dependent => :destroy
end

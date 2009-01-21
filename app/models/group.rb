class Group < ActiveRecord::Base
  has_many :subscribed_users, :through=>:memberships, :source=>:user
  has_many :memberships, :foreign_key=>'group_id'
  has_one  :category
end

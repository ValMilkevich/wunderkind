class User < ActiveRecord::Base
  has_many :posts, :foreign_key=>:author_id
  has_many :subscribed_groups, :through=>:memberships, :source=>:group
  has_many :memberships
  has_many :created_groups, :through=>:memberships, :source=>:group
  has_many :favorites
end

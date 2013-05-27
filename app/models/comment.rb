class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  attr_accessible :body, :commentable_id, :commentable_type, :user, :commentable
  validates :body, :presence => true
end

class Post < ActiveRecord::Base
   belongs_to :user
   belongs_to :board, :counter_cache => true
   #default_scope :order => 'created_at DESC'
   scope :recent, :order => 'updated_at DESC'
  attr_accessible :content, :title
end

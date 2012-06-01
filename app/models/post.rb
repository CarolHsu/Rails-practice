class Post < ActiveRecord::Base
   belongs_to :user
   belongs_to :board, :counter_cache => true
  attr_accessible :content, :title
end

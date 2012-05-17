class Post < ActiveRecord::Base
   belongs_to :user
   belongs_to :board
  attr_accessible :content, :title
end

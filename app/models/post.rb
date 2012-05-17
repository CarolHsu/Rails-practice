class Post < ActiveRecord::Base
   belongs_to :board
  attr_accessible :content, :title
end

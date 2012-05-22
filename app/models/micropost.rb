class Micropost < ActiveRecord::Base
   attr_accessible :content
   belongs_to :user
   validates :user_id, presence: true
   validates  :content, :length => { :maximum => 140 }
   default_scope order: 'microposts.created_at DESC'

end

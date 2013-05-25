class Relationships < ActiveRecord::Base
  attr_accessible :followeduser_id, :follower_id
end

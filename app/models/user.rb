class User < ActiveRecord::Base

  has_many  :playlists
  has_many  :bookmarks
  
  has_many :initiated_followings, class_name: "Following", foreign_key: :follower_id
  has_many :followeds, through: :initiated_followings, source: :followed

  has_many :received_followings, class_name: "Following", foreign_key: :followed_id
  has_many :followers, through: :received_followings, source: :follower


  def name
    first_name + " " + last_name
  end

  def name_and_count
    "#{first_name} #{last_name}(#{playlists.count})"
  end

end

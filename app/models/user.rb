class User < ActiveRecord::Base

  has_many  :playlists
  has_many  :bookmarks

  def name
    first_name + " " + last_name
  end

  def name_and_count
    "#{first_name} #{last_name}(#{playlists.count})"
  end

end

class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks,    as: :bookmarkable
  has_many :playlist_selections
  has_many :songs,  through: :playlist_selections

  validates :name, :presence => :true
  validates :user, :presence => :true
end

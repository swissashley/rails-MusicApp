# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  track_type :string           not null
#  lyric      :text
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  TRACK_TYPE = ["bonus", "regular"]
  validates :name, :track_type, :album_id, presence: true
  validates :track_type, inclusion: { in: TRACK_TYPE }

  belongs_to :album,
    dependent: :destroy
    
  has_one :band,
    through: :album
    source: :band
end

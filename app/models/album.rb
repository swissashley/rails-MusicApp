# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_type :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  ALBUM_TYPE = ["live","studio"]

  validates :name, :album_type, :band_id, presence: true
  validates :album_type, inclusion: { in: ALBUM_TYPE }

  belongs_to :band,
    dependent: :destroy

  has_many :tracks
end

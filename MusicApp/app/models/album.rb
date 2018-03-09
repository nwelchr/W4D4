# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :string           not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates :band_id, :title, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :title, uniqueness: true

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

  has_many :tracks, dependent: :destroy

end

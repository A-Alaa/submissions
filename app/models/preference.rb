# frozen_string_literal: true

class Preference < ApplicationRecord
  belongs_to :reviewer
  belongs_to :track
  belongs_to :audience_level
  has_one :user, through: :reviewer, dependent: :restrict_with_exception, inverse_of: :preferences

  validates :accepted, inclusion: { in: [true, false] }, reviewer_track: { if: :accepted? }
  validates :reviewer, existence: true
  validates :audience_level_id, presence: true, existence: true, same_conference: { target: :reviewer }, if: :accepted?
  validates :track_id, presence: true, existence: true, same_conference: { target: :reviewer }, if: :accepted?
end

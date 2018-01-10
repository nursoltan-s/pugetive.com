class Key < ApplicationRecord

  TONICS =  %w(A♭ A B♭ B C C♯ D♭ D E♭ E F F♯ G♭ G G♯)

  include Sluggable

  validates :name,       presence: true
  validates :short_name, presence: true

  has_many :songs
end
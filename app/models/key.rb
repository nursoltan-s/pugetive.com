TONICS =  %w(A♭ A B♭ B C C♯ D♭ D E♭ E F F♯ G♭ G G♯)

class Key < ApplicationRecord
  include Sluggable

  validates :name,       presence: true
  validates :short_name, presence: true

  has_many :songs
end
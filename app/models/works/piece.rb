class Piece < Work

  has_one :lyric, foreign_key: :work_id

  belongs_to :author, class_name: 'Author'

  default_scope { writing.includes(:lyric) }
  scope :reviews, -> {where(genre_id: 11)}
  scope :blogs,   -> {where('name LIKE "%typepad%" OR name LIKE "%medium%"')}
  # other projects = all   - @blogs - @reviews - @haiku.map{|s| s.works}.flatten

# Refactor
  def self.haiku
    Series.where('name LIKE "%haiku%"').first
  end

  def self.haikus
    haiku.works
  end

  def self.other_projects
    # FIXME performance tune this
    where(interest_id: WRITING_INTEREST_ID) - blogs - reviews - haiku.pieces
  end


  def blog?
    name =~ /blog/i
  end


end
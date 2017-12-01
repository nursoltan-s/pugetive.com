class Piece < Work
  has_one :lyric
  belongs_to :author, class_name: 'Author'

  scope :reviews,     -> {where(genre_id: 11)}

  def self.model_name
    Work.model_name
  end

  def blog?
    name =~ /blog/i
  end

end
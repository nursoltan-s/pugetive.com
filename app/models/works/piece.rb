class Piece < Work
  has_one :lyric, foreign_key: :work_id

  belongs_to :author, class_name: 'Author'

  scope :reviews, -> {where(genre_id: 11)}
  scope :blogs,   -> {where('name LIKE "%typepad%" OR name LIKE "%medium%"')}
  # other projects = all   - @blogs - @reviews - @haiku.map{|s| s.works}.flatten

  def self.haiku
    Series.haiku
  end

  def self.haikus
    haiku.works
  end

  def self.other_projects
    # FIXME performance tune this
    all - blogs - reviews - haiku.works
  end

  def blog?
    name =~ /blog/i
  end

  def self.random(num = 10)
    find(self.random_id(num))
  end

  # REFACTOR move up to Work parent with defined interest_id
  def self.random_id(num)
    if @random_ids.nil?
      sql = <<-SQL
        SELECT id
        FROM works
        WHERE interest_id = #{WRITING_INTEREST_ID}
      SQL
      @random_ids = ActiveRecord::Base.connection.select_values(sql)
    end
    return @random_ids.sample(num)
  end



    # @reviews = Piece.reviews
    # @haiku = Series.where('name LIKE "%haiku%"')
    # @projects = Piece.all   - @blogs - @reviews - @haiku.map{|s| s.works}.flatten


end
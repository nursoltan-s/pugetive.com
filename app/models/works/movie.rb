class Movie < Work

  default_scope {film}

  def self.random(num = 10)
    find(self.random_id(num))
  end

  # REFACTOR move up to Work parent with defined interest_id
  def self.random_id(num)
    if @random_ids.nil?
      sql = <<-SQL
        SELECT id
        FROM works
        WHERE interest_id = #{FILM_INTEREST_ID}
      SQL
      @random_ids = ActiveRecord::Base.connection.select_values(sql)
    end
    return @random_ids.sample(num)
  end


end
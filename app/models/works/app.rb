class App < Work
  default_scope { includes(wields: :tool).includes(:titles).where(interest_id: SOFTWARE_INTEREST_ID) }

  belongs_to :author, class_name: 'Developer'

  def self.model_name
    Work.model_name
  end


  def self.random(num = 10)
    find(self.random_id(num))
  end

  def self.random_id(num)
    if @random_ids.nil?
      sql = <<-SQL
        SELECT id
        FROM works
        WHERE interest_id = #{SOFTWARE_INTEREST_ID}
      SQL
      @random_ids = ActiveRecord::Base.connection.select_values(sql)
    end
    return @random_ids.sample(num)
  end


end
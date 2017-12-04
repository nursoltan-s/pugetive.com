class App < Work
  default_scope { software }

  def self.solo
    joins(:party).where("parties.id = 1 OR parties.alias = 1")
  end

  def self.random(num = 10)
    order("RAND()").limit(num)
  end

end
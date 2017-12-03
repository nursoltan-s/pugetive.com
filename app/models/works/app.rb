class App < Work
  default_scope { software }

  def self.random(num = 10)
    order("RAND()").limit(num)
  end

end
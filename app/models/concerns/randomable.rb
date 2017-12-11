module Randomable
  extend ActiveSupport::Concern

  included do

    def self.random(num = 10)
      order("RAND()").limit(num)
    end

  end


end


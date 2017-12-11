class Cache

  attr_reader :value

  def initialize(key, query_lambda)

    @value = Rails.cache.fetch key

    unless @value
      @value = query_lambda.call
      Rails.cache.write key, @value
    end
  end
end
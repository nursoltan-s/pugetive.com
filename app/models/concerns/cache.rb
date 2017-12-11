class Cache

  attr_accessor :value, :calling_class

  def initialize(key, method_chain)
    set_calling_class
    @value = Rails.cache.fetch key

    unless @value
      @value = execute_method_chain(method_chain.to_s.split('.'))
      Rails.cache.write key, @value
    end
  end

  private

    def set_calling_class
      unless @calling_classs
        if caller[1].match(/.*\/([^\/]+)\.rb/)
          filename = $1
          @calling_class = filename.classify.safe_constantize
        end
      end
    end

    def execute_method_chain(list_of_methods)
      list_of_methods.inject(calling_class) {|o, a| o.send(a) }
    end
end
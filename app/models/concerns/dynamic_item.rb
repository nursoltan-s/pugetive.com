class DynamicItem
  attr_reader :token, :item_id

  def initialize(token, item_id = nil)
    @token = token.to_s
    @item_id = item_id

    # Must recognize this class as mapping to a table name
    #  (or in the case of STI, the parent's table name)
    # unless database_tables.include? @token.tableize or
    #   database_tables.include? item_class.base_class.name.tableize
    #   raise Error, "Cannot instantiate DynamicItem with unrecognized token"
    # end
  end

  def item
    item_class.find(item_id)
  end

  def random
    item_class.random
  end

  def search
    item_class.search
  end

  def class_name
    token.classify
  end

  def item_class
    class_name.safe_constantize
  end

  def singular_token
    token.downcase.singularize
  end

  def plural_token
    token.downcase.pluralize
  end

  private

    def database_tables
      @database_tables || ActiveRecord::Base.connection.tables
    end

end

class MetaResource
  include ActiveSupport::Inflector
  attr_reader :context

  delegate :singular_token, :plural_token, :item_class, to: :dynamic_item

  def initialize(token, context)
    @token = token
    @context = context
  end

  def dynamic_item
    @dynamic_item ||= DynamicItem.new(@token)
  end

  def set_item(item_id)
    context.instance_variable_set("@#{singular_token}", item_class.find(url_identifier))
  end

  def set_items
    context.instance_variable_set("@#{plural_token}", item_class.all)
  end

  def item
    context.instance_variable_get("@#{singular_token}")
  end

  def items
    context.instance_variable_get("@#{plural_token}")
  end

  def strong_params_method
    context.send("#{singular_token}_params")
  end
end
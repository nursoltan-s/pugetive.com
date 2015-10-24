class MetaResource
  include ActiveSupport::Inflector
  attr_reader :controller_class, :item_id

  delegate :singular_token, :plural_token, :item_class, to: :dynamic_item

  def initialize(controller_param, id_param, controller_class)
    @token = controller_param
    @item_id = id_param
    @controller_class = controller_class
  end

  def dynamic_item
    @dynamic_item ||= DynamicItem.new(@token)
  end

  def set_item
    controller_class.instance_variable_set("@#{singular_token}", item_class.find(item_id))
  end

  def set_items
    controller_class.instance_variable_set("@#{plural_token}", item_class.all)
  end

  def item
    controller_class.instance_variable_get("@#{singular_token}")
  end

  def items
    controller_class.instance_variable_get("@#{plural_token}")
  end

  def item_params
    controller_class.send("#{singular_token}_params")
  end
end
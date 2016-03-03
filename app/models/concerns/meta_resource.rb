class MetaResource
  include ActiveSupport::Inflector
  attr_reader :controller_class, :action, :item_id

  delegate :singular_token, :plural_token, :item_class, to: :dynamic_item

  def initialize(controller_param, action_param, id_param, controller_class)
    @token = controller_param
    @action = action_param
    @item_id = id_param
    @controller_class = controller_class
  end

  def dynamic_item
    @dynamic_item ||= DynamicItem.new(@token)
  end

  def set_item
    if item_id and item_id.match(/\D/) and friendly_item = item_class.friendly.find(item_id)
      value = friendly_item
    elsif new_item
      value = new_item
    elsif item_id
      value = item_class.find(item_id)
    else
      value = item_class.new(item_params)
    end
    controller_class.instance_variable_set("@#{singular_token}", value)
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

  def items_url
    controller_class.send("#{plural_token}_url")
  end

  def new_item
    return nil unless action == 'new'
    @new_item ||= item_class.new
  end

end
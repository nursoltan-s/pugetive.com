class MetaResourceController < ApplicationController
  before_action :set_meta_resource
  before_action :set_item, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_items, only: [:index]

  rescue_from Pundit::NotAuthorizedError,          with: :render_unauthorized


  attr_reader :meta_resource
  delegate :item, :items, :item_params, :items_url, :set_item, :set_items, to: :meta_resource

  def index
    policy_scope(items)
    authorize(items)
  end

  def show
    authorize(item)
    if request.path != send("#{meta_resource.singular_token}_path", item)
      return redirect_to item, :status => :moved_permanently
    end

  end

  def new
    authorize(item, :new?)
  end

  def edit
    authorize(item, :update?)
  end

  def create
    authorize(item, :create?)
    respond_to do |format|
      if item.save
        respond_with_success(format, 'created')
      else
        respond_with_error(format, :new)
      end
    end
  end

  def update
    authorize(item, :update?)
    respond_to do |format|
      if item.update(item_params)
        format.html { redirect_to post_update_path, notice: "#{item.class.name} was successfully updated." }
        format.json { render :show, status: :ok, location: item }
      else
        format.html { render :edit }
        format.json { render json: item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize(item, :destroy?)
    item.destroy
    respond_to do |format|
      format.html { redirect_to post_destroy_path, notice: "#{item.class.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

    def respond_with_success(format, action_name)
      format.html { redirect_to post_create_path, notice: "#{item.class.name} was successfully #{action_name}." }
      format.json { render :show, status: :created, location: item }
    end

    def respond_with_error(format, response_action)
      format.html { render response_action }
      format.json { render json: item.errors, status: :unprocessable_entity }
    end

    def set_meta_resource
      @meta_resource = MetaResource.new(params[:controller], params[:action], params[:id], self)
    end

    def post_create_path
      item
    end

    def post_update_path
      item
    end

    def post_destroy_path
      items
    end

end
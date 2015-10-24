class MetaResourceController < ApplicationController
  before_action :set_meta_resource
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_items, only: [:index]

  attr_reader :meta_resource
  delegate :item, :items, :item_params, :set_item, :set_items, :item_class, :plural_token, :singular_token, to: :meta_resource


  def index
    policy_scope(items)
    authorize(items)
  end

  def show
    authorize(item)
  end

  # def new
  #   @email = Email.new
  #   authorize @email
  # end

  def edit
    authorize(item, :update?)
  end

  # def create
  #   @email = Email.new(email_params)

  #   respond_to do |format|
  #     if @email.save
  #       format.html { redirect_to @email, notice: 'Email was successfully created.' }
  #       format.json { render :show, status: :created, location: @email }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @email.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    authorize(item, :update?)
    respond_to do |format|
      if item.update(item_params)
        format.html { redirect_to item, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: item }
      else
        format.html { render :edit }
        format.json { render json: item.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @email.destroy
  #   respond_to do |format|
  #     format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end


  private

    def set_meta_resource
      @meta_resource = MetaResource.new(params[:controller], params[:id], self)
    end


end
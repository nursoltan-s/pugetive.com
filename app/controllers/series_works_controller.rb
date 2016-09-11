class SeriesWorksController < ApplicationController
  before_action :set_series_work, only: [:show, :edit, :update, :destroy]

  # GET /series_works
  # GET /series_works.json
  def index
    @series_works = SeriesWork.all
  end

  # GET /series_works/1
  # GET /series_works/1.json
  def show
  end

  # GET /series_works/new
  def new
    @series_work = SeriesWork.new
  end

  # GET /series_works/1/edit
  def edit
  end

  # POST /series_works
  # POST /series_works.json
  def create
    @series_work = SeriesWork.new(series_work_params)

    respond_to do |format|
      if @series_work.save
        format.html { redirect_to @series_work, notice: 'Series work was successfully created.' }
        format.json { render :show, status: :created, location: @series_work }
      else
        format.html { render :new }
        format.json { render json: @series_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series_works/1
  # PATCH/PUT /series_works/1.json
  def update
    respond_to do |format|
      if @series_work.update(series_work_params)
        format.html { redirect_to @series_work, notice: 'Series work was successfully updated.' }
        format.json { render :show, status: :ok, location: @series_work }
      else
        format.html { render :edit }
        format.json { render json: @series_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series_works/1
  # DELETE /series_works/1.json
  def destroy
    @series_work.destroy
    respond_to do |format|
      format.html { redirect_to series_works_url, notice: 'Series work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series_work
      @series_work = SeriesWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_work_params
      params.require(:series_work).permit(:series_id, :work_id)
    end
end

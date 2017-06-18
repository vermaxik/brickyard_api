class Api::V1::MainsController < ApplicationController
  before_action :set_api_v1_main, only: [:show, :update, :position, :destroy]

  # GET /api/v1/mains
  def index
    @api_v1_mains = Main.all

    render json: @api_v1_mains
  end

  # GET /api/v1/mains/1
  def show
    render json: @api_v1_main
  end

  # POST /api/v1/mains
  def create
    @api_v1_main = Main.new(api_v1_main_params)

    if @api_v1_main.save
      render json: @api_v1_main, status: :created, location: [:api, :v1, @api_v1_main]
    else
      render json: @api_v1_main.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/mains/1
  def update
    if @api_v1_main.update(api_v1_main_params)
      render json: @api_v1_main
    else
      render json: @api_v1_main.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/mains/1/position
  def position
    if @api_v1_main.insert_at(params[:position])
      render json: @api_v1_main
    else
      render json: @api_v1_main.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/mains/1
  def destroy
    @api_v1_main.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_main
      @api_v1_main = Main.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_main_params
      params.fetch(:main, {}).permit(:state, :position)
    end
end

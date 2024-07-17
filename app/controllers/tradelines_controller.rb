class TradelinesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @tradelines = Tradeline.all
    render json: @tradelines.as_json(methods: :outstanding_balance)
  end

  def show
    @tradeline = Tradeline.find(params[:id])
    render json: @tradeline.as_json(methods: :outstanding_balance)
  end

  def create
    @tradeline = Tradeline.new(tradeline_params)

    if @tradeline.save
      render json: @tradeline, status: :created
    else
      render json: @tradeline.errors, status: :unprocessable_entity
    end
  end

  private

  def not_found
    render json: 'not_found', status: :not_found
  end

  def tradeline_params
    params.require(:tradeline).permit(:name, :amount)
  end
end
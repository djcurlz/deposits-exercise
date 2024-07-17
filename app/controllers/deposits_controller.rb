class DepositsController < ApplicationController
  before_action :set_tradeline

  def index
    @deposits = @tradeline.deposits
    render json: @deposits
  end

  def show
    @deposit = @tradeline.deposits.find(params[:id])
    render json: @deposit
  end

  def create
    @deposit = @tradeline.deposits.build(deposit_params)

    if @deposit.save
      render json: @deposit, status: :created
    else
      render json: @deposit.errors, status: :unprocessable_entity
    end
  end

  private

  def set_tradeline
    @tradeline = Tradeline.find(params[:tradeline_id])
  end

  def deposit_params
    params.require(:deposit).permit(:date, :amount)
  end
end

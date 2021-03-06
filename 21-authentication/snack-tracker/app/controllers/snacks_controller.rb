class SnacksController < ApplicationController

    before_action :find_snack, only: [:edit, :show, :update, :destroy]

  def welcome
  end

  def index
    @snacks = Snack.all
  end

  def show
    cookies["favorite"] = "chocolate-chip"
    session["favorite"] = "oatmeal raisin"
  end

  def new
    @snack = Snack.new
  end

  def create
    @snack = Snack.create(snack_params)
    if @snack.errors.any?
      # render :new
    else
      redirect_to snack_path(@snack)
    end
  end

  def edit
  end

  def update
    @snack.update(snack_params)
    redirect_to @snack
  end

  def destroy
    @snack.destroy
    redirect_to snacks_path
  end

  private

  def snack_params
    params.require(:snack).permit(:name, :deliciousness, :calories, :retailer_id)
  end

  def find_snack
    @snack = Snack.find(params[:id])
  end
end

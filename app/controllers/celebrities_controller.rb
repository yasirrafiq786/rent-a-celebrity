class CelebritiesController < ApplicationController
  before_action: :set_celebrity, only: [:show, :edit, :update]

  def index
    @celebrities = Celebrity.all
  end

  def show; end

  def new
    @celebrity = Celebrity.new
  end

  def edit; end

  def update
    @celebrity = Celebrity.update(celebrity_params)
    redirect_to celebrity_path(@celebrity)
  end

 def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.user = current_user

    if @celebrity.save
      redirect_to celebrity_path(@celebrity)
    else
      render 'new'
    end
  end

private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

  def celebrity_params
    params.require(:celebrity).permit(:name, :description, :price_per_day, :location)
  end
end

class CelebritiesController < ApplicationController

  def index
    @celebrities = Celebrity.all
  end

  def show
    @celebrity = Celebrity.find(params[:id])
  end

  def new
    @celebrity = Celebrity.new
  end

   def edit
    @celebrity = Celebrity.find(params[:id])
  end

  def update
  end

 def create
    @celebrity = Celebrity.new(celebrity_params)
    if @celebrity.save
      redirect_to celebrity_path(@celebrity)
    else
      render 'new'
    end
  end

private

  def celebrity_params
    params.require(:celebrity).permit(:name, :description, :price_per_day, :location)
  end
end

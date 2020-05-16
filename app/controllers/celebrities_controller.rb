class CelebritiesController < ApplicationController

 before_action :set_celebrity, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query"
      @celebrities = Celebrity.where(sql_query, query: "%#{params[:query]}%")
    else    
    @celebrities = Celebrity.all
    @chatroom = Chatroom.first
  end
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

  def destroy
    @celebrity.destroy
    redirect_to celebrities_path(@celebrity)
  end

private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

  def celebrity_params
    params.require(:celebrity).permit(:name, :description, :price_per_day, :location, photos: [])
  end
end

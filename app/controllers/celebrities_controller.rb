class CelebritiesController < ApplicationController

 before_action :set_celebrity, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query"
      @celebrities = Celebrity.where(sql_query, query: "%#{params[:query]}%")
    else    
    @celebrities = Celebrity.all
  end
end

  def show
    @celebrities = Celebrity.geocoded

    @markers = @celebrities.map do |celebrity|
      {
        lat: celebrity.latitude,
        lng: celebrity.longitude
      }
    end
  end

  def new
    @celebrity = Celebrity.new
  end


 def edit; end




  def update
    @celebrity.update(celebrity_params)
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

class BandsController < ApplicationController
  before_action :require_user!

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:success] = "Band successfully created!"
      redirect_to bands_url
    else
      flash[:errors] = "Couldn't create a band ｡･ﾟ･(ﾉД`)ヽ(￣ω￣ )"
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      flash[:success] = "Successfully edited band!"
      redirect_to band_url(@band)
    else
      flash[:errors] = @bands.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    flash[:success] = "Byebye :("
    redirect_to bands_url
  end

  def band_params
    params.require(:band).permit(:name)
  end

end

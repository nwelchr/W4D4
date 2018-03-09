class AlbumsController < ApplicationController

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      flash[:success] = "Album successfully created!"
      redirect_to band_url(@album.band)
    else
      flash[:errors] = "Couldn't create a album ｡･ﾟ･(ﾉД`)ヽ(￣ω￣ )"
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:success] = "Successfully edited album!"
      redirect_to album_url(@album)
    else
      flash[:errors] = @albums.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:success] = "Byebye :("
    redirect_to albums_url
  end

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live)
  end

end

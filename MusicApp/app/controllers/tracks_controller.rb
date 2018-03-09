class TracksController < ApplicationController

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      flash[:success] = "Track successfully created!"
      redirect_to album_url(@track.album)
    else
      flash[:errors] = "Couldn't create a track ｡･ﾟ･(ﾉД`)ヽ(￣ω￣ )"
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      flash[:success] = "Successfully edited track!"
      redirect_to bands_url
    else
      flash[:errors] = @tracks.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    flash[:success] = "Byebye :("
    redirect_to tracks_url
  end

  def track_params
    params.require(:track).permit(:title, :album_id, :ord, :lyrics, :bonus)
  end

end

class TracksController < ApplicationController
  def new
    @album_id = params[:album_id]
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      fail
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track.delete
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render album_url(@track.album)
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :track_type, :album_id, :lyric)
  end
end

class AlbumsController < ApplicationController
  def new
    @band_id = params[:band_id]
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      fail
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album.delete
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render band_url(@album.band)
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :album_type, :band_id)
  end
end

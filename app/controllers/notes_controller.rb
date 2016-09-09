class NotesController < ApplicationController

  def create
    params[:note][:user_id] = current_user.id
    @note = Note.new(note_params)
    if @note.save
      redirect_to track_url(@note.track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track)
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if @note.delete
      redirect_to track_url(@note.track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track)
    end
  end

  def note_params
    params.require(:note).permit(:note_text, :user_id, :track_id)
  end

end

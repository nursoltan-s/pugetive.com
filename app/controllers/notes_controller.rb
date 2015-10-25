class NotesController < MetaResourceController

  def new
    @note = Note.new(noteable_id: params[:noteable_id],
                     noteable_type: params[:noteable_type])
    authorize(@note)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:noteable_type, :noteable_id, :contents)
    end

    def post_create_path
      @note.subject
    end
end

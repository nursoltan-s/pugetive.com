class LyricsController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def lyric_params
      params.require(:lyric).permit(:work_id, :content)
    end

    def post_update_path
      @lyric.work
    end
end

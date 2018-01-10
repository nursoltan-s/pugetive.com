class KeysController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_params
      params.require(:key).permit(:work_id, :content)
    end

    def post_create_path
      @lyric.work
    end

end
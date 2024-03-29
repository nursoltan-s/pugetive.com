module Interesting
  extend ActiveSupport::Concern

  included do
    belongs_to :interest

    validates :interest_id, numericality: true, inclusion: {in: Interest::INTEREST_IDS}

    scope :software,    -> {where(interest_id: SOFTWARE_INTEREST_ID)}
    scope :music,       -> {where(interest_id: MUSIC_INTEREST_ID)}
    scope :photography, -> {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}
    scope :film,        -> {where(interest_id: FILM_INTEREST_ID)}
    scope :writing,     -> {where(interest_id: WRITING_INTEREST_ID)}


    def software?
      interest_id == SOFTWARE_INTEREST_ID
    end

    def music?
      interest_id == MUSIC_INTEREST_ID
    end

    def photography?
      interest_id == PHOTOGRAPHY_INTEREST_ID
    end

    def film?
      interest_id == FILM_INTEREST_ID
    end

    def writing?
      interest_id == WRITING_INTEREST_ID
    end

    private

      def type_and_interest_match?
        case interest_id
        when SOFTWARE_INTEREST_ID
          type == 'App'
        when MUSIC_INTEREST_ID
          type == 'Song'
        when PHOTOGRAPHY_INTEREST_ID
          type == 'Photo'
        when FILM_INTEREST_ID
          type == 'Movie'
        when WRITING_INTEREST_ID
          type == 'Piece'
        end
      end

  end


end




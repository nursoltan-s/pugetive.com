module Interesting
  extend ActiveSupport::Concern

  included do

    scope :software,    -> {where(interest_id: SOFTWARE_INTEREST_ID)}
    scope :music,       -> {where(interest_id: MUSIC_INTEREST_ID)}
    scope :photography, -> {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}
    scope :film,        -> {where(interest_id: FILM_INTEREST_ID)}
    scope :writing,     -> {where(interest_id: WRITING_INTEREST_ID)}


    def writing?
      interest_id == PHOTOGRAPHY_INTEREST_ID
    end

    def photography?
      interest_id == PHOTOGRAPHY_INTEREST_ID
    end

  end


end




module Noteable
  extend ActiveSupport::Concern

  included do
    belongs_to :noteable, polymorphic: true, touch: true
    has_many :notes, as: :noteable, dependent: :destroy

    def noteable?
      true
    end
  end


end


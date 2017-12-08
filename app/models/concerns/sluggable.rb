module Sluggable
  extend ActiveSupport::Concern

  included do

    extend FriendlyId
    friendly_id :name, use: [:slugged, :history]

    def should_generate_new_friendly_id?
      slug.blank? || name_changed?
    end

    def normalize_friendly_id(string)
      super(string.to_s.gsub("\'", ''))
    end
  end


end


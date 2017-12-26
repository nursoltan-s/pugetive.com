module Imageable
  extend ActiveSupport::Concern

  included do
    has_many :images, as: :imageable, dependent: :destroy
    accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['data'].blank? }


    def has_image?
      images.any?
    end

    def image
      images.first
    end

  end

end
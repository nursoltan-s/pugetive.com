module Documentable
  extend ActiveSupport::Concern

  included do
    has_many :documents, as: :documentable, dependent: :destroy
    accepts_nested_attributes_for :documents, reject_if: proc { |attributes| attributes['data'].blank? }

  end

end
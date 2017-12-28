class Variant < ApplicationRecord

  include Documentable

  validates :work_id, presence: true
  validates :name,    presence: true
  validates :year, inclusion: {in: YEARS_OF_LIFE}, allow_blank: true

  belongs_to :work, touch: true

  def has_audio?
    mp3_document.present?
  end

  def has_score?
    pdf_document.present?
  end

  def mp3_url
    mp3_document.url
  end

  def score
    pdf_document
  end

  private

    def mp3_document
      @mp3_document ||= documents.find{|d| d.mp3?}
    end

    def pdf_document
      @pdf_document ||= documents.find{|d| d.pdf?}
    end

end

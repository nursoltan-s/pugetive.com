class Party < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  TYPES = ['Company', 'Artist', 'School', 'NonProfit', 'Band']
  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  # validates :url
  validates :start_year, inclusion: {in: YEARS_OF_LIFE, allow_nil: true}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE, allow_nil: true}
  validate :stop_is_after_start
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}
  validates :alias, inclusion: {in: BOOLEAN_OPTIONS}

  has_attached_file(:image, Pugetive::Application.config.paperclip_image_opts)
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  scope :bands, -> {where(type: 'Band')}

  def image_token
    'party'
  end

  def self.sorted
    all.sort_by{|p| p.alpha_name}
  end

  def has_image?
    image.url.present? and not image.url(:thumb).match(/missing/)
  end

  def alpha_name
    name.gsub(/^(The|A)\s+/, '')
  end

  def date_range
    DateRange.new(start_year, stop_year)
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def years
    date_range.years
  end

  private

    def stop_is_after_start
      return if stop_year.nil?
      if stop_year < start_year
        errors.add(:stop_year, "must be equal to or later than start year")
      end
    end

end

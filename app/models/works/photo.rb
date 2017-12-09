class Photo < Work

  belongs_to :author, class_name: 'Photographer'
  has_many :flickr_urls, foreign_key: :work_id

  has_many :galleries, through: :series_works, source: :series, class_name: 'Gallery'

  default_scope {includes(:flickr_urls).where(interest_id: PHOTOGRAPHY_INTEREST_ID)}

  scope :flickr,      -> {where("flickr_id IS NOT NULL AND flickr_id != ''")}
  scope :sorted, -> {order("stop_year DESC, instagram_id DESC, flickr_id DESC, id DESC")}
  scope :websites,    -> {where('name LIKE "%flickr%" OR name LIKE "%instagram%"')}

  validate :hosted_image_id_must_be_present


  def camera
    tools.first
  end

  def year
    years
  end

  def thumbnail(*args)
    hosted_image.thumbnail(*args)
  end

  def large(*args)
    hosted_image.large(*args)
  end

  private

    def hosted_image
      @hosted_image ||= HostedImage.new(self)
    end

    def hosted_image_id_must_be_present
      if flickr_id.present? or instagram_id.present?
        return
      else
        errors.add(:flickr_or_instagram, "must be present")
      end
    end


end


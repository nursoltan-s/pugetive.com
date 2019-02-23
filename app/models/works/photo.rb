class Photo < Work

  belongs_to :author, class_name: 'Photographer'
  has_many :flickr_urls, foreign_key: :work_id

  has_many :galleries, through: :series_works, source: :series, class_name: 'Gallery'

  default_scope {includes(:flickr_urls) }

  scope :flickr,   -> {where("flickr_id IS NOT NULL AND flickr_id != ''")}
  scope :sorted,   -> {order("stop_year DESC, instagram_id DESC, flickr_id DESC, id DESC")}
  scope :websites, -> {where('name LIKE "%flickr%" OR name LIKE "%instagram%"')}

  validate :hosted_image_id_must_be_present


  def self.todays_sample_photo
    photos = self.joins(:series_works).uniq.sort_by{|photo| Digest::SHA1.hexdigest(photo.id.to_s)}
    days_since_epoch =  Date.today.to_time.to_i / (60 * 60 * 24)
    photo_index = days_since_epoch % photos.length
    photo = photos[photo_index]
    # photo = Photo.find(327) # Cairo via Instagram
    # photo = Photo.find(306) # Luxor eye via Flickr
  end

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

  def url
    hosted_image.url
  end

  def flickr?
    flickr_id.present?
  end

  def instagram?
    instagram_id.present?
  end

  def palette
    if instagram?
      image_url = FinalRedirectUrl.final_redirect_url(url)
    else
      image_url = url
    end
    colors = Miro::DominantColors.new(image_url)
    return colors.to_hex
    # return Array.new(8, '#000')
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


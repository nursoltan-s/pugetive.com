class Photo < Work

  belongs_to :author, class_name: 'Photographer'
  has_many :flickr_urls, foreign_key: :work_id


  has_many :galleries, through: :series_works, source: :series, class_name: 'Gallery'


  default_scope {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}

  scope :flickr,      -> {where("flickr_id IS NOT NULL AND flickr_id != ''")}
  scope :sorted, -> {order("stop_year DESC, instagram_id DESC, flickr_id DESC")}
  scope :websites,    -> {where('name LIKE "%flickr%" OR name LIKE "%instagram%"')}

  def self.model_name
    Work.model_name
  end

  def camera
    tools.first
  end


  def year
    years
  end

  def refresh_flickr_urls
    # Flickr photo sizes
    # url_s : Square
    # url_q : Large Square
    # url_t : Thumbnail
    # url_m : Small
    # url_n : Small 320
    # url   : Medium
    # url_z : Medium 640
    # url_c : Medium 800
    # url_b : Large
    # url_o : Original
    return unless flickr_id.present?

    FlickRaw.api_key = PUGETIVE_CONFIG[Rails.env][:flickr_api_key]
    FlickRaw.shared_secret = PUGETIVE_CONFIG[Rails.env][:flickr_secret]

    info = flickr.photos.getInfo(photo_id: flickr_id)
    [:url_q, :url, :url_b, :url_o, :url_z].each do |token|
      if url = FlickRaw.send(token, info)
        existing_row = flickr_urls.find_by_flickraw_token(token)
        if existing_row
          existing_row.update!(url: url)
        else
          FlickrUrl.create!(work_id: self.id, flickraw_token: token, url: url)
        end
      else
        raise 'failed'
      end
    end

  end

  def self.random(num = 10)
    includes(:flickr_urls).find(self.random_id(num))
  end

  def self.random_id(num = 1)
    if @photo_ids.nil?
      sql = <<-SQL
        SELECT DISTINCT works.id
        FROM series, series_works, works
        WHERE series.name like "%portfolio%"
        AND series_works.series_id = series.id
        AND series_works.work_id = works.id
      SQL
      @photo_ids = ActiveRecord::Base.connection.select_values(sql)
    end
    return @photo_ids.sample(num)
  end


end


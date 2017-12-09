class FlickrUrl < ApplicationRecord
  validates :work_id, numericality: true
  validates :flickraw_token, presence: true
  validates :url, presence: true

  belongs_to :work

  def self.refresh(photo)
    FlickRaw.api_key       = PUGETIVE_CONFIG[Rails.env][:flickr_api_key]
    FlickRaw.shared_secret = PUGETIVE_CONFIG[Rails.env][:flickr_secret]
    return unless photo.flickr_id.present?

    flickr_info = flickr.photos.getInfo(photo_id: photo.flickr_id)
    [:url_q, :url, :url_b, :url_o, :url_z].each do |token|
      update_flickr_url(photo, flickr_info, token)
    end

  end

  private

    def self.update_flickr_url(photo, flickr_info, token)
      FlickRaw.api_key       = PUGETIVE_CONFIG[Rails.env][:flickr_api_key]
      FlickRaw.shared_secret = PUGETIVE_CONFIG[Rails.env][:flickr_secret]

      if url = FlickRaw.send(token, flickr_info)
        existing_row = photo.flickr_urls.find_by(flickraw_token: token)
        if existing_row
          existing_row.update!(url: url)
        else
          FlickrUrl.create!(work_id: photo.id, flickraw_token: token, url: url)
        end
      end
    end


end

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

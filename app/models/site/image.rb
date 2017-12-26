class Image < ActiveRecord::Base

  has_attached_file(:data,
                    Pugetive::Application.config.paperclip_image_opts)

  validates_attachment :data,
                       presence: true,
                       size: { :in => 0..10.megabytes },
                       content_type: { :content_type => /^image\/(jpg|jpeg|png|gif)$/ }

  validates :imageable_type, presence: true
  belongs_to :imageable, :polymorphic => true, touch: true

  def subject
    imageable
  end

  def url(size = nil)
    data.url(size)
  end

end



class Document < ActiveRecord::Base

  has_attached_file(:data,
                    Pugetive::Application.config.paperclip_document_opts)

  validates_attachment_file_name :data, :matches => [/(pdf|mp3)\Z/]

  validates :documentable_type, presence: true

  belongs_to :documentable, :polymorphic => true, touch: true

  def subject
    documentable
  end

  def url
    data.url
  end

  def pdf?
    data_content_type.match(/^application\/pdf$/)
  end

  def mp3?
    data_content_type == 'audio/mpeg'
  end

  # def url(size = nil)
  #   Aws::CF::Signer.sign_url(data.url)
  # end
end

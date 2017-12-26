class Document < ActiveRecord::Base
  include ConfigHelper

  has_attached_file(:data,
                    Pugetive::Application.config.paperclip_document_opts)

  validates_attachment :data,
      :presence => true,
      :size => { :in => 0..10.megabytes },
      :content_type => { :content_type => [/^application\/pdf$/] }

  validates :documentable_type, presence: true

  belongs_to :documentable, :polymorphic => true, touch: true

  def subject
    documentable
  end

  def url
    data.url
  end

  # def url(size = nil)
  #   Aws::CF::Signer.sign_url(data.url)
  # end
end

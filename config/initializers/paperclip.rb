SHARED_S3_CONFIG = {
  storage:         :s3,
  s3_region:       'us-east-1',
  s3_headers:      { 'Cache-Control' => 'max-age=315576000',
                      'Expires' => 1.year.from_now.httpdate },
  s3_protocol:     PUGETIVE_CONFIG[Rails.env][:host_protocol],
  url:             ':s3_alias_url'
}

Pugetive::Application.config.paperclip_image_opts = SHARED_S3_CONFIG.merge(
    styles: { large:  "1200x800>",
              medium: "600x400>",
              small:  "300x200>",
              thumb:  "100x100#" },
    convert_options: {all: "-quality 92 -strip -sharpen 0x3" },
    s3_host_alias:   PUGETIVE_CONFIG[Rails.env][:s3_images_host],
    s3_credentials:  {access_key_id:     PUGETIVE_CONFIG[Rails.env][:s3_access_key_id],
                      secret_access_key: PUGETIVE_CONFIG[Rails.env][:s3_secret_access_key],
                      bucket:            PUGETIVE_CONFIG[Rails.env][:s3_images_bucket]},
    path:            ':subject_class/:subject_id/:subject_class-:subject_id.:id.:style.:extension',
    default_url:     "/errors/missing-image.png"
  )

Pugetive::Application.config.paperclip_document_opts = SHARED_S3_CONFIG.merge(
    path:            ':subject_class/:subject_id/:subject_class-:subject_id.:id.:extension',
    s3_host_alias:   PUGETIVE_CONFIG[Rails.env][:s3_documents_host],
    s3_credentials:  {access_key_id:     PUGETIVE_CONFIG[Rails.env][:s3_access_key_id],
                      secret_access_key: PUGETIVE_CONFIG[Rails.env][:s3_secret_access_key],
                      bucket:            PUGETIVE_CONFIG[Rails.env][:s3_documents_bucket]},
    validate_media_type: false
  )


Paperclip.interpolates :subject_class do |attachment, style|
  attachment.instance.subject.class.name.underscore
end

Paperclip.interpolates :subject_id do |attachment, style|
  attachment.instance.subject.id
end


# From:
# https://stackoverflow.com/questions/4801905/paperclip-sharpening-processor-causes-resizing-styles-not-to-work
# module Paperclip
#   class Sharpen < Paperclip::Processor
#     def initialize(file, options = {}, attachment = nil)
#       super
#       @file = file
#       @current_format = File.extname(@file.path)
#       @basename = File.basename(@file.path, @current_format)
#     end

#     def make
#       dst = Tempfile.new(@basename)
#       dst.binmode

#       command = "#{File.expand_path(@file.path)} -sharpen 0x3 #{File.expand_path(dst.path)}"

#       begin
#         success = Paperclip.run("convert", command)
#       rescue PaperclipCommandLineError
#         raise PaperclipError, "There was an error converting sharpening the image for #{@basename}"
#       end

#       dst
#     end
#   end
# end


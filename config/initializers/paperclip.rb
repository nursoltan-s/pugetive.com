Pugetive::Application.config.paperclip_image_opts = {
  styles: { large:  "1200x800>",
          medium: "600x400>",
          small:  "300x200>",
          thumb:  "100x100#" },
  convert_options: { :all => "-quality 100 -strip" },
  storage:         :s3,
  s3_region:       'us-east-1',
  s3_host_alias:   PUGETIVE_CONFIG[Rails.env][:s3_images_host],
  s3_credentials:  {access_key_id:     PUGETIVE_CONFIG[Rails.env][:s3_access_key_id],
                    secret_access_key: PUGETIVE_CONFIG[Rails.env][:s3_secret_access_key],
                    bucket:            PUGETIVE_CONFIG[Rails.env][:s3_images_bucket]},
  s3_headers:      { 'Cache-Control' => 'max-age=315576000',
                      'Expires' => 1.year.from_now.httpdate },
  s3_protocol:     PUGETIVE_CONFIG[Rails.env][:host_protocol],
  url:             ':s3_alias_url',
  path:            ':subject_class/:subject_id/:subject_class-:subject_id.:id.:extension',
  default_url:     "/images/default/missing.png"}



Paperclip.interpolates :subject_class do |attachment, style|
  attachment.instance.class.name.underscore
end

Paperclip.interpolates :subject_id do |attachment, style|
  attachment.instance.id
end



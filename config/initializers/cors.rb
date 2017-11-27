Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(PUGETIVE_CONFIG[Rails.env][:domain],
            PUGETIVE_CONFIG[Rails.env][:asset_host],
            PUGETIVE_CONFIG[Rails.env][:s3_images_host])
    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end
end
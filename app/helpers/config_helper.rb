module ConfigHelper

  def web_host(env_token = Rails.env)
    PUGETIVE_CONFIG[env_token][:host_with_port]
  end

  def host_protocol(env_token = Rails.env)
    PUGETIVE_CONFIG[env_token][:host_protocol]
  end

  def host_port(env_token = Rails.env)
    PUGETIVE_CONFIG[env_token][:port]
  end

end
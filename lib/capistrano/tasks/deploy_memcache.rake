# NOTE: Requires passwordless sudo
namespace :memcache do
  task :flush do
    on roles(:app) do
      sudo("/etc/init.d/memcached restart")
    end
  end
end


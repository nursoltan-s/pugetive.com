require 'rack-mini-profiler'

# initialization is skipped so trigger it
Rack::MiniProfilerRails.initialize!(Rails.application)
Rack::MiniProfiler.config.position = 'right'

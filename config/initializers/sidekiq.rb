# Sidekiq.configure_server do |config|
#   config.logger.level = Logger::INFO
#   # config.log_formatter = Sidekiq::Logger::Formatters::JSON.new

#   # if Rails.env.development?
#   #     config.redis = { url: url, namespace: 'beep-sac' }
#   # else
#   #     config.redis = { url: url }
#   # end

#   config.failures_max_count = 5000
#   config.failures_default_mode = :all
# end

# Sidekiq.configure_client do |config|
#   if Rails.env.development?
#       config.redis = { url: url, namespace: 'beep-sac' }
#   else
#       config.redis = { url: url }
#   end
# end
Sidekiq.configure_server do |config|
  config.redis = { url: (ENV["REDIS_URL"] || 'redis://localhost:6379/0'), namespace: "sidekiq-#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: (ENV["REDIS_URL"] || 'redis://localhost:6379/0'), namespace: "sidekiq-#{Rails.env}" }
end

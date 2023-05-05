web: bundle exec puma -C config/puma.rb
worker: RAILS_MAX_THREADS=5 bundle exec sidekiq
postdeploy: bundle exec rails db:migrate

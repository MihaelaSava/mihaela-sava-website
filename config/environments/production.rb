require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot for better performance and memory savings.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Enable caching in production.
  config.action_controller.perform_caching = true

  # Allow Rails to serve public files (like HTML, CSS, JS) in production.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Cache assets for far-future expiry since they are all digest stamped.
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{1.year.to_i}"
  }

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Force all access to the app over SSL, use Strict-Transport-Security, and secure cookies.
  config.force_ssl = false

  # SSL is handled by Kamal proxy (Caddy + Let's Encrypt)
  config.action_dispatch.default_headers = {
    "X-Forwarded-Proto" => "https"
  }

  # Log to STDOUT with the current request id as a default log tag.
  config.log_tags = [ :request_id ]
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new($stdout))

  # Log level (change to :debug for more verbosity)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Suppress deprecation warnings.
  config.active_support.report_deprecations = false

  # Cache store (you can change to :mem_cache_store or :redis_cache_store)
  config.cache_store = :memory_store

  # Active Job (background jobs)
  config.active_job.queue_adapter = :async

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Don't dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Allow requests from your domain and IP
  config.hosts << "mihaela-sava.com"
  config.hosts << "www.mihaela-sava.com"
  config.hosts << "164.92.244.56"

  # Allow health checks from Kamal proxy (internal Docker hostnames)
  config.hosts << /[a-f0-9]+/
  config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end

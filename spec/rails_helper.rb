ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
include Warden::Test::Helpers
Warden.test_mode!

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before( :suite ) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.around( :each ) do |spec|
    if spec.metadata[:js]
      spec.run
      DatabaseCleaner.clean_with :deletion
    else

      DatabaseCleaner.start
      spec.run
      DatabaseCleaner.clean

      begin
        ActiveRecord::Base.connection.send :rollback_transaction_records, true
      rescue
      end
    end
  end
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

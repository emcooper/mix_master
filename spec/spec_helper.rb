require 'database_cleaner'
require 'rails_helper'

DatabaseCleaner.strategy = :truncation
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.before(:all) do
    DatabaseCleaner.clean
  end
  config.after(:all) do
    DatabaseCleaner.clean
  end
end

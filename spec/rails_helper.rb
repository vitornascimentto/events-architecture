ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# require 'sidekiq/testing'
# require 'super_diff/rspec-rails'
# require 'view_component/test_helpers'

# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# ActiveJob::Uniqueness.test_mode!
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # config.before(:suite) do
  #   Project.reindex
  # end

  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.render_views
  # config.include EmailSpec::Helpers
  # config.include EmailSpec::Matchers
  config.include ActiveSupport::Testing::TimeHelpers
  config.include(Shoulda::Matchers::ActiveModel)
  config.include(Shoulda::Matchers::ActiveRecord)
  config.include FactoryBot::Syntax::Methods
  # config.include AuthSpecHelper, type: :controller
  # config.include JsonFixtureHelper, type: :model
  # config.include SeatModelSpecHelper, type: :model
  # config.include ReindexJobHelper, type: :model
  # config.include ViewComponent::TestHelpers, type: :component

  config.example_status_persistence_file_path = Rails.root.join('tmp/examples.txt')

  config.after(type: :job) do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end

# RSpec::Matchers.define_negated_matcher :not_change, :change
# RSpec::Matchers.define_negated_matcher :not_have_enqueued_job, :have_enqueued_job

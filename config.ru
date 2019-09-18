require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# Send PATCH and DELETE requests
use Rack::MethodOverride

run ApplicationController

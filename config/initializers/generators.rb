Rails.application.config.generators do |g|
  g.stylesheets false
  g.javascripts false
  g.helper false
  g.decorator false
  g.skip_routes true
  g.test_framework :rspec,
    fixtures: true,
    request_specs: true,
    controller_specs: false,
    view_specs: false,
    helper_specs: false,
    routing_specs: false
end

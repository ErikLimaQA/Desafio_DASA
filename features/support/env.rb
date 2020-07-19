require 'capybara/cucumber'
require 'capybara/dsl'
require 'cucumber'
require 'capybara/rspec/matchers'
require 'rspec'
require 'page-object'
require 'site_prism'

World (Capybara::DSL)
World (Capybara::RSpecMatchers)

Capybara.configure do |config|
	config.default_driver = :selenium_chrome
	config.default_max_wait_time = 10
	config.app_host = 'https://dasa.com.br'
end


# frozen_string_literal: true

Kaminari.configure do |config|
  # config.default_per_page = 25
  # config.max_per_page = nil
  config.window = 1
  # config.outer_window = 3
  config.left = 1
  config.right = 1
  # config.page_method_name = :page
  # config.param_name = :page
  # config.params_on_first_page = false
end

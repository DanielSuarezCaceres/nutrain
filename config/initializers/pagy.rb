require 'pagy/extras/bootstrap'
require 'pagy/extras/array'
Pagy::VARS[:items] = 6 # default items of each page. Customize in controller if necessary
#Rails.application.config.assets.paths << Pagy.root.join('javascripts') -> for asset pipeline, not necessary with Webpacker
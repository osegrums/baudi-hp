# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( back_end.css back_end.js )
Rails.application.config.assets.precompile += %w( blueimp-gallery/loading.gif blueimp-gallery/error.png blueimp-gallery/play-pause.png
  blueimp-gallery/error.svg blueimp-gallery/play-pause.svg blueimp-gallery/video-play.png blueimp-gallery/video-play.svg )
Rails.application.config.assets.precompile += %w( linens.js beds.js )

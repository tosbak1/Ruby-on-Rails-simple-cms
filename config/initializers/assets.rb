# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
#This automatically precompiles application.css
#We made a new manifest file tho called admin.css so we have to configure that

Rails.application.config.assets.precompile += %w( admin.css )

#If you had additional manifest files, then you do it like below
#Rails.application.config.assets.precompile += %w( admin.css main.css)

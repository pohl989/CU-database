# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(

home.js
home.css

user.js
user.css

profiles.js
profiles.css

tables.js
tables.css

clients.js
clients.css

check.min.js
query.jeditable.js
grid.locale-el.js
query.jqGrid.min.js
query-ui.min.js
ootable.all.min.js

steps/jquery.steps.min.js
steps/jquery.steps.css

validate/jquery.validate.min.js

datapicker/bootstrap-datepicker.js
)

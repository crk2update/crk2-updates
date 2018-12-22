# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure the secrets in this file are kept private
# if you're sharing your code publicly.

development:
  secret_key_base: 2bef76c1da71355e7687783afdae560bbbf4215b582bcc1bfa2b540aa7fa1b4d9f32cc3f792395087e90dc08c1c56929a5e8b4df832a04637b5227db63af8cbd

test:
  secret_key_base: 4f93cba974e3972d3ccaec879ffede5bb916a67c7f6224a576f1484e007decc1c2023ce6c262a7f6f7311a4c2c8dc6dbf93e3d7ead18bb79189ea8bbe3ef1c98

# Do not keep production secrets in the repository,
# instead read values from the environment.
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>

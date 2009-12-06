# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oop-solid-sample_session',
  :secret      => '01c998b3b5f9a1a426df4337b52f1231720b5d3f51361eedac9a32ebc35a4c00ac8367a33fb67b3858b16ec61e6187dc10878d8187bd175eb6cc51f810b924db'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_calendar_session',
  :secret      => '0df9c9a4cd51f65850bae3b9c8f883d0a354d08e0b11a282c42cce4e2809357049c809a63dc6d855765d0ceee946bdede89c49fc9cb4c146e927477bdb02dc0c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

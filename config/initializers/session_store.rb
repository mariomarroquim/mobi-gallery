# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mobigallery_session',
  :secret      => '5f33f27136469f645ef0a8eabace89aa77bb097ecc78b04894dc1cf84e90169eedbf051d12349062df9177c3446cf909ef4ad4df87403de5d32ed9f4ba5efad6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

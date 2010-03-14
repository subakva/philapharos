# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_philapharos_session',
  :secret      => 'd5d5c26b0424695b4338ef431256ce66db6bf01f206d5613bbe7bd90b557b63f11deefd82e8cfdac5c21916f0dd4f6172c5dc0ce0e67a4e816bb390fd837537c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

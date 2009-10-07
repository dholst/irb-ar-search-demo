# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blog-awesomeness_session',
  :secret      => '97fa0a47efcedbb83ae0c97f75afd44d95a4747683df24087567ca39923555696c55a592b6c8e01fdfceaeda4ac354b5b6ac73595547b125b558f00f984ce5f2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

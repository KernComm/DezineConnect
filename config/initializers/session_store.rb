# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MyMovies_session',
  :secret      => '45ddd9f89c98eae16507a083ee4ef7020f191b56c60447774ce89f2bdb13cedf8e844c41636966f30c2ec46c52f429d821857416e508a20e0c3e9293a9430af9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

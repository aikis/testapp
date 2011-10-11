Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'jl6Dh9PGJh76DG8OQpmtw', 'w6OL1XQiTgytFH3P6ntEcXdpgL3dEjRAIl5itx90'
  # provider :google_apps, 'jl6Dh9PGJh76DG8OQpmtw', 'w6OL1XQiTgytFH3P6ntEcXdpgL3dEjRAIl5itx90'
  # provider :facebook, 'jl6Dh9PGJh76DG8OQpmtw', 'w6OL1XQiTgytFH3P6ntEcXdpgL3dEjRAIl5itx90'
  # provider :vkontakte_open_api, "App's ID"
end
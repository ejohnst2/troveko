Devise.setup do |config|
  config.omniauth :facebook, ENV["FB_ID"], ENV["FB_SECRET"],
    scope: 'email',
    info_fields: 'email, first_name, last_name',
    image_size: 'square',  # 50x50, guaranteed ratio
    secure_image_url: true

  config.omniauth :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET'],
    scope: "email,profile,offline",
    prompt: "consent",
    info_fields: 'email, first_name, last_name',
    image_size: 'square',  # 50x50, guaranteed ratio
    secure_image_url: true

config.omniauth :instagram, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
    # scope: 'email',
    info_fields: 'email, first_name, last_name',
    image_size: 'square',  # 50x50, guaranteed ratio
    secure_image_url: true

config.omniauth :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],
    scope: 'email',
    info_fields: 'email, first_name, last_name',
    image_size: 'square',  # 50x50, guaranteed ratio
    secure_image_url: true

end

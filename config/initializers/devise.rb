Devise.setup do |config|
  config.omniauth :facebook, ENV["FB_ID"], ENV["FB_SECRET"],
    scope: 'email',
    info_fields: 'email, first_name, last_name',
    image_size: 'square',  # 50x50, guaranteed ratio
    secure_image_url: true
end

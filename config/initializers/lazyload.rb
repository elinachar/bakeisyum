Lazyload::Rails.configure do |config|
  # By default, a 1x1 grey gif is used as placeholder ("data:image/gif;base64,...").
  # This can be easily customized:
  # config.placeholder = "/public/img/grey.gif"
  config.placeholder = "data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mM8//R2PQAIKgMQbLTh9gAAAABJRU5ErkJggg=="


  # image_tag can return lazyload-friendly images by default,
  # no need to pass the { lazy: true } option
  config.lazy_by_default = true
end

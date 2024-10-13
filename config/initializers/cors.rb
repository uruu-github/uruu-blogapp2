Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # ここを適切なオリジンに変更します（例: 'http://localhost:3000'）
    resource '*',
      headers: :any,
      methods: [:get, :post, :options],
      expose: ['Access-Control-Allow-Origin']
  end
end

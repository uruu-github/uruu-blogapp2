class AttachmentsController < ApplicationController
  protect_from_forgery with: :null_session  # CSRFトークンを無効にする場合（APIの場合）

  def create
    # アップロードされたファイルを取得
    @attachment = params[:attachment]

    # 適切なストレージにファイルを保存する処理
    # 例: public/uploadsに保存
    File.open(Rails.root.join('public', 'uploads', @attachment.original_filename), 'wb') do |file|
      file.write(@attachment.read)
    end

    # レスポンスとしてファイルのURLを返す
    render json: { url: "/uploads/#{@attachment.original_filename}" }
  end
end

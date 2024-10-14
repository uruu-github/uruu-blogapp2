// Turboをインポート
import "@hotwired/turbo-rails";
// Trixをimportmapを使用してインポート
import "trix";
import "trix.css"; // TrixのCSSをimportmapからインポート
// ActionTextをインポート
import "@rails/actiontext";

// Trixエディタの初期化とファイルアップロード処理
document.addEventListener("trix-attachment-add", function(event) {
  const attachment = event.attachment;

  // ファイルをアップロードするためのFormDataを作成
  const formData = new FormData();
  formData.append("attachment", attachment.file);

  // アップロード先のURLを設定（必要に応じて変更）
  const uploadUrl = "/attachments"; // ここは実際のエンドポイントに変更

  // fetchを使ってサーバーにPOSTリクエストを送信
  fetch(uploadUrl, {
    method: "POST",
    body: formData,
  })
  .then(response => {
    if (response.ok) {
      return response.json(); // JSONとしてレスポンスをパース
    }
    throw new Error("Network response was not ok."); // エラー処理
  })
  .then(data => {
    // サーバーからのレスポンスデータを使用してTrixにURLを設定
    attachment.setAttributes({
      url: data.url,  // サーバーから返された画像のURL
      href: data.url   // リンク用URL
    });
  })
  .catch(error => {
    console.error("Error uploading:", error); // エラーをコンソールに表示
    // エラー処理（必要に応じて追加）
  });
});

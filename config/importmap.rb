pin "application" # アプリケーションのエントリーポイント
pin "trix", to: "https://cdn.jsdelivr.net/npm/trix@2.1.6/dist/trix.umd.min.js"  # 最新のCDNを指定
pin "trix.css", to: "https://cdn.jsdelivr.net/npm/trix@2.1.6/dist/trix.min.css"  # TrixのCSSも追加
pin "@rails/actiontext", to: "actiontext.esm.js" # ActionTextをピン
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # Turbo Railsをピン
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # Stimulusをピン

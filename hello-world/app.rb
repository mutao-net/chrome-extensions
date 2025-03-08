require "unloosen"

content_script site: "www.example.com" do
  h1 = document.querySelector("h1")
  h1.innerText = "Hello unloosen!"

  chrome.runtime.onMessage.addListener do |message|
    h1 = document.querySelector("h1")
    h1.innerText = message
    true
  end
end

# ポップアップ機能を追加
popup do
  # メッセージ要素を取得
  message_element = document.getElementById("message")
  
  # メッセージを設定
  message_element.innerText = "Hello World from Ruby!"
  
  # 現在の時刻を追加
  current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  time_element = document.createElement("p")
  time_element.innerText = "現在の時刻: #{current_time}"
  message_element.appendChild(time_element)
end 

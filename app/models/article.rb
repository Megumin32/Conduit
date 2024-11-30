class Article < ApplicationRecord
  # マークダウンをHTMLに変換するメソッド
  def content_as_html
    Kramdown::Document.new(content).to_html
  end
end
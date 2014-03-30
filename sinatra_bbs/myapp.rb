require 'sinatra'
require 'sinatra/reloader'
require 'mysql2'
require 'erubis'
set :erb, :escape_html => true


# 書き込み用のテキストフォーム
get '/tweets/new' do
    erb :"tweets/new"
end

# TODO: 書き込みを行なう(INSERT)

# TODO: DBに接続する
get '/tweets/create' do
    client = Mysql2::Client.new({:host => "localhost", :username => "root", :password => "nagomi1126", :database => "sinatra_bbs"})

    #フォームからパラメータを受け取る
    entry = params[:entry]
    
    #パラメータをエスケープする
    escaped_entry = client.escape(entry)
    
    # TODO: tweetを新規作成する
    client.query("insert into tweets set entry = '#{escaped_entry}';")
    
    # TODO: DBを切断する
    client.close
    
    # TODO: ブラウザに結果を表示する
     
end
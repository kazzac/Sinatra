require 'sinatra'

require 'sinatra/reloader' 
#ホスト再起動なしで変更を反映させるために必要
#ちなみに、ホスト再起動はSinatraでcontrol+C

before do
    @author = "Kazunari"
end

after do
    logger.info "Page displayed successfully!"
end
#ログはターミナル画面に表示される

helpers do
    def strong(s)
        "<strong>#{s}</strong>"
    end
end
# helpersを使ってよく使う処理を関数化
# helpersの中に複数の処理を書いてもよい

=begin
get '/hello/:name' do
    "hello #{params[:name]}"
end

get '/hello/:name' do |n|
    "hello #{n}"
end

get '/hello/:fname/?:lname?' do |f,l|
    "hello #{f} #{l}"
end
# ?を付けることでオプショナルになる

get '/from/*/to/*' do |f,t|
    "from #{f} to #{t}"
end

get %r{/users/([0-9]*)} do |i|
    # %r{} で正規表現を表す（Ruby）
    "User ID = #{i}"
end

get '/' do
    erb :index
    # :index とファイルをシンボル化して
    # viewsフォルダのindex.erbを呼び出す
end

get '/:name' do |n|
    @name = n
    @title = "main index"
    erb :index
end
=end

get '/' do
    @title = "main index"
    @content = "main content by " + @author
    erb :index
end

get '/about' do
    @title = "about this page"
    @content = "This page is ...by " + strong(@author)
    @email = "kazunari.omotezako@gmail.com"
    erb :about
end
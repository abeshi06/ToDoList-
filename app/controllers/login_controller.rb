class LoginController < ApplicationController
  skip_before_action :check_logined
  def index
  	reset_session
  end

  def auth
  	# 入力値がユーザー情報に存在するかどうか認証する
  	## 存在すれば、対象オブジェクト
  	## 存在しなければnil
  	usr = User.authenticate(params[:userid], params[:password])
  	if usr then
  	  # セッションの初期化
  	  reset_session
  	  # セッションに対象のユーザーのIDを保存
  	  session[:usr] = usr.id
  	  session[:usernamwe] = usr.username
  	  # タスク一覧へ移動
  	  redirect_to tasks_path
  	else
  	  @error = 'ユーザーID/パスワードが間違っています。'
  	  render 'index'
  	end
  end
end

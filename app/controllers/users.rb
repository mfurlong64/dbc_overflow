get '/users' do
  @users = User.all
  erb :'index'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.create(name: params[:name], email: params[:email],password: params[:password])
  session[:id] = @user.id

  redirect "/users/#{@user.id}"
end

get '/users/login' do
  erb :login
end

post '/users/login' do
  @user = User.authenticate(params[:email], params[:password_hash])
  if @user
    session[:user_id] = @user.id
    redirect "users/#{@user.id}"
  else
    erb :login
  end
end

get '/users/logout' do
  session[:id] = nil
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show"
end



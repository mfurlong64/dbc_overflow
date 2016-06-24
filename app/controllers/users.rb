get '/users' do
  @users = User.all
  erb :'index'
end

get '/users/register' do
  @user = User.new
  erb :'/users/register'
end

post '/users' do
  @user = User.new(params[:info])
  @user.save
  redirect '/users'
end

get '/users/login' do
  erb :'users/login'
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/users/#{user.id}'
  else
    erb :'login'
  end
end



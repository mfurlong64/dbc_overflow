get '/users' do
  @users = User.all
  erb :'index'
end

get '/users/new' do
  @user = User.create(name: params[:name], email: params[:email])
  erb :'/users/register'
end

post '/users' do
  @user = User.new(name: params[:name], email: params[:email], password: params[:password])
  session[:id] = @user.id
  redirect "/users/#{@user.id}"
end

get '/users/login' do
   @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:id] = @user.id
    redirect '/users/#{@user.id}'
  else
    erb :'index'
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



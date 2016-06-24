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
  #    @user = User.authenticate(params[:email], params[:password])
  #    p @user
  #    p "3"*24
  # if @user
  #   session[:id] = @user.id
  #   redirect "users/#{@user.id}"
  # else
  #   erb :'index'
  # end
  @user = User.find_by_email(params[:email])
  p @user
  p "3"*24
  if @user.password == params[:password]
    p "insttid pafee"
    session[:id] = @user.id
    redirect "users/#{@user.id}"
  else
    p "outisd the paeer"
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



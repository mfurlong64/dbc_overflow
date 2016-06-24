get '/users' do
  @users = User.all
  erb :'index'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  #error handling!!!
  @user = User.create(name: params[:name], email: params[:email],password: params[:password])
  session[:user_id] = @user.id

  redirect "/users/#{@user.id}"
end

get '/users/login' do
  erb :login
end

post '/users/login' do
  @user = User.authenticate(params[:email], params[:password])
  p @user
  if @user
    session[:user_id] = @user.id
    p @user.id
    redirect "users/#{@user.id}"
  else
    erb :login
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show"
end

get '/questions/new' do
  p "PPPPPPPPPPPPPPPPPPfsdPgPdxfPPhdfn"
  erb :'/Questions/question'
end

post '/questions/new' do
   @question = Question.create(title: params[:title], body: params[:body], user_id: session[:user_id])
   redirect '/'
end


# post '/horses' do 
#   @horse = Horse.create(params['horse'])

#   if request.xhr?
#     erb :'horses/index'
#   else
#     redirect '/horses'
#   end
# end

get '/questions/new' do
  erb :'/Questions/question'
end

post '/questions/new' do
   @question = Question.create(title: params[:title], body: params[:body], user_id: session[:user_id])
   redirect '/'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'/questions/show'
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'/questions/show'
end

get '/questions/:id/vote' do
  @question = Question.find(params[:id])
  @question.votes.create(user_id: session[:user_id], value: 1)

  redirect "/questions/#{@question.id}"
end

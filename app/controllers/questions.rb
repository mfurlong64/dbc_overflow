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

post '/questions/:id/vote' do

  @question = Question.find(params[:id])

  if @question.id.user_id == session[:user_id]
    redirect "/questions/#{@question.id}"
  else

  new_vote = Votes.new(user_id: session[:user_id], value: 1, voteable_id: @question.id)
  new_vote.save

 if request.xhr?
    content_type :json
    { questionId: @question.id,
      voteId: new_vote
      }.to_json
  else
    redirect "/questions/#{@question.id}"
  end
end
end

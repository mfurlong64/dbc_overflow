get '/answers/new' do
	@answers = Answer.all 
	redirect '/'
end
get '/' do
  @question = Question.all
 # @question_hash = @question.each { |question| {question_id: question.id, title: question.title, }}
 erb :'index'
end

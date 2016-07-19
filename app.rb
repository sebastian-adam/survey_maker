require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

get('/surveys/new') do
  erb(:survey_form)
end

get('/surveys/:id') do
  @survey = Survey.find(params['id'])
  @questions = Question.all()
  erb(:survey)
end

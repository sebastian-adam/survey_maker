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

post('/surveys') do
  title = params['title']
  @survey = Survey.create({title: title})
  question = params['q1_1']
  answer1 = params['pa1_1']
  answer2 = params['pa2_1']
  answer3 = params['pa3_1']
  answer4 = params['pa4_1']
  @question = Question.create({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})

  question = params['q1_2']
  answer1 = params['pa1_2']
  answer2 = params['pa2_2']
  answer3 = params['pa3_2']
  answer4 = params['pa4_2']
  if question != nil
    @question2 = Question.create({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})
  end

  question = params['q1_3']
  answer1 = params['pa1_3']
  answer2 = params['pa2_3']
  answer3 = params['pa3_3']
  answer4 = params['pa4_3']
  if question != nil
    @question3 = Question.create({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})
  end
  @surveys = Survey.all()
  erb(:index)
end

delete('/surveys/:id') do
  @survey = Survey.find(params['id'])
  @survey.destroy()
  @surveys = Survey.all()
  erb(:index)
end

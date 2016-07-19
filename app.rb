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

get('/surveys/:id/edit') do
  @survey = Survey.find(params['id'])
  @questions = @survey.questions()
  erb(:survey_edit)
end

post('/surveys') do
  title = params['title']
  @survey = Survey.create({title: title})
  question = params['q_1']
  answer1 = params['pa1_1']
  answer2 = params['pa2_1']
  answer3 = params['pa3_1']
  answer4 = params['pa4_1']
  @question = Question.create({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})

  question = params['q_2']
  answer1 = params['pa1_2']
  answer2 = params['pa2_2']
  answer3 = params['pa3_2']
  answer4 = params['pa4_2']
  if question != ""
    @question2 = Question.create({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})
  end

  question = params['q_3']
  answer1 = params['pa1_3']
  answer2 = params['pa2_3']
  answer3 = params['pa3_3']
  answer4 = params['pa4_3']
  if question != ""
    @question3 = Question.create({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})
  end
  @surveys = Survey.all()
  erb(:index)
end

delete('/surveys/:id') do
  @survey = Survey.find(params['id'])
  @questions = Question.all()
  @questions.each() do |question|
    if question.survey == @survey
      question.destroy()
    end
  end
  @survey.destroy()
  @surveys = Survey.all()
  erb(:index)
end

patch('/surveys/:id') do
  @survey = Survey.find(params['id'])
  @questions = Question.all()
  @questions.each() do |question|
    if question.survey == @survey
      if (@question != nil) & (@question2 != nil)
        @question3 = question
      elsif @question != nil
        @question2 = question
      else
        @question = question
      end
    end
  end
  title = params['title']
  @survey.update({title: title})

  question = params['20']
  answer1 = params['1']
  answer2 = params['2']
  answer3 = params['3']
  answer4 = params['4']
  if question != ""
    @question.update({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})
  end

  question = params['21']
  answer1 = params['5']
  answer2 = params['6']
  answer3 = params['7']
  answer4 = params['8']
  if question != ""
    @question2.update({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})
  end

  question = params['22']
  answer1 = params['9']
  answer2 = params['10']
  answer3 = params['11']
  answer4 = params['12']
  if question != ""
    @question3.update({q: question, pa1: answer1, pa2: answer2, pa3: answer3, pa4: answer4, survey_id: @survey.id()})
  end
  @surveys = Survey.all()
  Question.order('id ASC')
  erb(:index)
end

require('spec_helper')

describe(Question) do
  describe("#survey") do
    it('tells you which survey it belongs to') do
      test_survey = Survey.create({title: "My Survey"})
      test_question1 = Question.create({q: "Is this my survey?", survey_id: test_survey.id()})
      expect(test_question1.survey()).to(eq(test_survey))
    end
  end
end

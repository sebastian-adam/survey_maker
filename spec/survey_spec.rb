require("spec_helper")

describe(Survey) do
  describe("#questions") do
    it('returns all questions from the survey') do
      test_survey = Survey.create({title: "My Survey"})
      test_question1 = Question.create({q: "Is this my survey?", survey_id: test_survey.id()})
      test_question2 = Question.create({q: "Are you sure this is my survey?", survey_id: test_survey.id()})
      expect(test_survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
end

class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = answer.new
  end
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.save
    redirect_back fallback_location: @question_url
  end

  private
  def answer_params
    params.require(:answer).permit(:answer).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end

class QuestionsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @questions = Question.all.order("id DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.includes(:user)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to "/"
  end

  private
  def question_params
    params.require(:question).permit(:title, :question).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end

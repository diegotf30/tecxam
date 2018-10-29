class QuestionsController < ApplicationController
  before_action :set_question, only: [:update, :destroy, :show, :edit]
  after_action :render_json, except: [:index, :tags]

  def index
    @questions = Question.where(user: User.first) # CHANGE
    json_response(@questions)
  end

  def create
    @question = Question.create(question_params)
    exam.add_question(@question) unless exam.nil?
  end

  def update
    @question.update(question_params)
  end

  def destroy
    @question.destroy
  end

  def tags
    @tags = User.first.tags
    json_response(@tags)
  end

  private

  def exam
    @exam ||= Exam.find(params[:exam_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params
      .permit(:name, :tag)
      .merge(user: User.first) # CHANGE
  end

  def render_json
    json_response(@question)
  end
end

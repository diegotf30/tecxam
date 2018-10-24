class ExamsController < ApplicationController
  before_action :set_exam, only: [:update, :destroy, :edit]
  after_action :render_json, except: [:index]

  def index
    @exams = Exam.where(user: User.first) # CHANGE
    json_response(@exams)
  end

  def create
    @exam = Exam.create(exam_params)
  end

  def update
    @exam.update(exam_params)
  end

  def edit
  end

  def destroy
    @exam.destroy
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params
      .require(:exam)
      .permit(:name, :is_random)
      .merge(user: User.first) # CHANGE
  end

  def render_json
    json_response(@exam)
  end
end

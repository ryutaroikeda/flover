class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.js
      else
        format.html { render root_path }
      end
    end
  end

  private
  def question_params
    params.require(:question).permit(:author, :title, :content, :all_tags)
  end
end

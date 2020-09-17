class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = set_student
  end

  def activate_student
    @student = set_student # self.set_student will fail to call the private method
    @student.active ? @student.update(active: false) : @student.update(active: true)
    redirect_to action: "show"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
class TeachersController < ApplicationController
  before_action :find_teacher, :only => [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

	def new
		@teacher = Teacher.new
	end

	def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, :notice => "Teacher was successfully created."
    else
      render 'new'
    end
	end

  def show
  end

  def edit
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, :notice => "Teacher was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
  end

	private

	def teacher_params
    params.require(:teacher).permit!
	end

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end

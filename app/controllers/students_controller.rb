class StudentsController < ApplicationController
	before_action :find_teacher, :only => [:index, :new, :create, :show, :edit, :destroy, :update]
	before_action :find_student, :only => [:show, :edit, :update, :destroy]

	def index
    @students = @teacher.students
	end
  
  def new
    @student = @teacher.students.build
  end

  def create
    @student = @teacher.students.build(student_params)
    if @student.save
      redirect_to teacher_students_path(@teacher), :notice => "Student was created successfully."
    else
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to teacher_students_path(@teacher), :notice => "Student was created successfully."
    else
      render 'edit'
    end
  end

  def destroy
  	@student.destroy
  	redirect_to teacher_students_path(@teacher), :notice => "Student was deleted successfully."
  end

  private
  
  def student_params
    params.require(:student).permit!
  end

  def find_teacher
    @teacher = Teacher.find(params[:teacher_id])                                           
  end

  def find_student
    @student = Student.find(params[:id])                                           
  end

end

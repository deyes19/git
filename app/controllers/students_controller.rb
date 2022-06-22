class StudentsController < ApplicationController
    def new
        @student=Student.new #crear
        @students=Student.all #obtener todos los estudaintes
    end

    def create
        @student = Student.new(student_params)
        if @student.save #guardar en sql
            redirect_to new_student_path
        end
    end
    private
    def student_params
        params.require(:student).permit(:name, :lastname, :ndoc)
    end

end

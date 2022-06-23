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
    def edit
        @student=Student.find(params[:id])
        
    end
    def update
        @student=Student.find(params[:id])
        
        if @student.update(student_params)
            redirect_to @students
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @student=Student.find(params[:id])
        @student.destroy

        redirect_to root_path, status: :see_other
        
    end

    private
    def student_params
        params.require(:student).permit(:name, :lastname, :ndoc)
    end

end

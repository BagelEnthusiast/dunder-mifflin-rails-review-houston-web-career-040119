class EmployeesController < ApplicationController

    before_action :current_employee, only: [:show, :edit, :update, :destroy]

    def index
        #byebug
        @employees = Employee.all
    end

    def show
        
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        

        if @employee.valid? 
            @employee.save
            redirect_to @employee
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to new_employee_path
            # byebug
        end
    end

    def edit

    end

    def update
        @employee.update(employee_params)
        redirect_to @employee
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    private

    def current_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end



end

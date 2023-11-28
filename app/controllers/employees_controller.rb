class EmployeesController < ApplicationController
  before_action :set_employees, only: %i[show edit update]
  before_action :set_team

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.team = @team
    @employee.save
    if @employee.save
      redirect_to team_employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @employee.update(employee_params)
    @employee.save

    redirect_to team_employee_path(@employee)
  end

  private

  def set_employees
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :role, :birthdate)
  end

  def set_team
    @team = current_user.team
    # @team = Team.find(params[:team_id])
  end
end

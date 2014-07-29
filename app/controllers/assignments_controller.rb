class AssignmentsController < ApplicationController
  def new
    @person = Person.find(params[:person_id])
    @assignment = Assignment.new
  end

  def create
    @person = Person.find(params[:person_id])
    @assignment = @person.assignments.new(params.require(:assignment).permit(:location_id, :role))
    if @person.save
      redirect_to person_path(@person.id)
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    @person = Person.find(params[:person_id])
    @assignment = Assignment.find(params[:id])

    if @assignment.update(params.require(:assignment).permit(:location_id, :role))
      redirect_to person_path(@person.id)
    else
      render :new
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.delete
    redirect_to person_path(params[:person_id])
  end
end
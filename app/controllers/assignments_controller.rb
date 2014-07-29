class AssignmentsController < ApplicationController
  def new
    @person = Person.find(params[:person_id])
    @assignment = Assignment.new
  end

  def create
    @person = Person.find(params[:person_id])
    @assignment = @person.assignments.new(params.require(:assignment).permit(:location_id, :role))
    @person.save
    redirect_to person_path(@person.id)
  end
end
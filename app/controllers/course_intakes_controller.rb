class CourseIntakesController < ApplicationController
  before_action :set_course_intake, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /course_intakes
  # GET /course_intakes.json
  def index
    @course_intakes = CourseIntake.all
  end

  # GET /course_intakes/1
  # GET /course_intakes/1.json
  def show
  end

  # GET /course_intakes/new
  def new
    @course_intake = CourseIntake.new
  end

  # GET /course_intakes/1/edit
  def edit
  end

  # POST /course_intakes
  # POST /course_intakes.json
  def create
    @course_intake = CourseIntake.new(course_intake_params)

    respond_to do |format|
      if @course_intake.save
        format.html { redirect_to @course_intake, notice: 'Course intake was successfully created.' }
        format.json { render :show, status: :created, location: @course_intake }
      else
        format.html { render :new }
        format.json { render json: @course_intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_intakes/1
  # PATCH/PUT /course_intakes/1.json
  def update
    respond_to do |format|
      if @course_intake.update(course_intake_params)
        format.html { redirect_to @course_intake, notice: 'Course intake was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_intake }
      else
        format.html { render :edit }
        format.json { render json: @course_intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_intakes/1
  # DELETE /course_intakes/1.json
  def destroy
    @course_intake.destroy
    respond_to do |format|
      format.html { redirect_to course_intakes_url, notice: 'Course intake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_intake
      @course_intake = CourseIntake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_intake_params
      params.require(:course_intake).permit(:course_id, :course_location_id, :start_date, :start_time, :end_date, :end_time, :days_of_week, :status, :price, :slug)
    end
end

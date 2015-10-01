class CourseLocationsController < ApplicationController
  before_action :set_course_location, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: [:show]
  layout 'admin', except: :show
  load_and_authorize_resource
  # GET /course_locations
  # GET /course_locations.json
  def index
    @course_locations = CourseLocation.all
  end

  # GET /course_locations/1
  # GET /course_locations/1.json
  def show
  end

  # GET /course_locations/new
  def new
    @course_location = CourseLocation.new
  end

  # GET /course_locations/1/edit
  def edit
  end

  # POST /course_locations
  # POST /course_locations.json
  def create
    @course_location = CourseLocation.new(course_location_params)

    respond_to do |format|
      if @course_location.save
        format.html { redirect_to @course_location, notice: 'Course location was successfully created.' }
        format.json { render :show, status: :created, location: @course_location }
      else
        format.html { render :new }
        format.json { render json: @course_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_locations/1
  # PATCH/PUT /course_locations/1.json
  def update
    respond_to do |format|
      if @course_location.update(course_location_params)
        format.html { redirect_to @course_location, notice: 'Course location was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_location }
      else
        format.html { render :edit }
        format.json { render json: @course_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_locations/1
  # DELETE /course_locations/1.json
  def destroy
    @course_location.destroy
    respond_to do |format|
      format.html { redirect_to course_locations_url, notice: 'Course location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_location
      @course_location = CourseLocation.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_location_params
      params.require(:course_location).permit(:name, :city, :address_one, :address_two, :suburb, :state, :postcode, :country, :latitude, :longitude, :slug)
    end
end

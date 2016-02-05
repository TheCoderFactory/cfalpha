class PrequestionnairesController < ApplicationController
  before_action :set_prequestionnaire, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  layout 'admin', except: :new
  # GET /prequestionnaires
  # GET /prequestionnaires.json
  def index
    if current_user.has_role? :admin
      @prequestionnaires = Prequestionnaire.all
    else
      redirect_to root_path
    end
  end

  # GET /prequestionnaires/1
  # GET /prequestionnaires/1.json
  def show
  end

  # GET /prequestionnaires/new
  def new
    @prequestionnaire = Prequestionnaire.new
  end

  # GET /prequestionnaires/1/edit
  def edit
  end

  # POST /prequestionnaires
  # POST /prequestionnaires.json
  def create
    @prequestionnaire = Prequestionnaire.new(prequestionnaire_params)

    respond_to do |format|
      if @prequestionnaire.save
        format.html { redirect_to thanks_path(thanks: 'prequestionnaire'), notice: 'Prequestionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @prequestionnaire }
      else
        format.html { render :new }
        format.json { render json: @prequestionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prequestionnaires/1
  # PATCH/PUT /prequestionnaires/1.json
  def update
    respond_to do |format|
      if @prequestionnaire.update(prequestionnaire_params)
        format.html { redirect_to @prequestionnaire, notice: 'Prequestionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @prequestionnaire }
      else
        format.html { render :edit }
        format.json { render json: @prequestionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prequestionnaires/1
  # DELETE /prequestionnaires/1.json
  def destroy
    @prequestionnaire.destroy
    respond_to do |format|
      format.html { redirect_to prequestionnaires_url, notice: 'Prequestionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prequestionnaire
      @prequestionnaire = Prequestionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prequestionnaire_params
      params.require(:prequestionnaire).permit(:course_booking_id, :reason, :background, :experience, :hobbies, :referrer)
    end
end

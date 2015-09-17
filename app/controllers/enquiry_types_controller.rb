class EnquiryTypesController < ApplicationController
  before_action :set_enquiry_type, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /enquiry_types
  # GET /enquiry_types.json
  def index
    @enquiry_types = EnquiryType.all
  end

  # GET /enquiry_types/1
  # GET /enquiry_types/1.json
  def show
  end

  # GET /enquiry_types/new
  def new
    @enquiry_type = EnquiryType.new
  end

  # GET /enquiry_types/1/edit
  def edit
  end

  # POST /enquiry_types
  # POST /enquiry_types.json
  def create
    @enquiry_type = EnquiryType.new(enquiry_type_params)

    respond_to do |format|
      if @enquiry_type.save
        format.html { redirect_to @enquiry_type, notice: 'Enquiry type was successfully created.' }
        format.json { render :show, status: :created, location: @enquiry_type }
      else
        format.html { render :new }
        format.json { render json: @enquiry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enquiry_types/1
  # PATCH/PUT /enquiry_types/1.json
  def update
    respond_to do |format|
      if @enquiry_type.update(enquiry_type_params)
        format.html { redirect_to @enquiry_type, notice: 'Enquiry type was successfully updated.' }
        format.json { render :show, status: :ok, location: @enquiry_type }
      else
        format.html { render :edit }
        format.json { render json: @enquiry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquiry_types/1
  # DELETE /enquiry_types/1.json
  def destroy
    @enquiry_type.destroy
    respond_to do |format|
      format.html { redirect_to enquiry_types_url, notice: 'Enquiry type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry_type
      @enquiry_type = EnquiryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enquiry_type_params
      params.require(:enquiry_type).permit(:name, :description)
    end
end

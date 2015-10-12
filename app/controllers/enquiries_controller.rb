class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: [:responded_to, :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  layout 'admin', except: [:new, :create]
  invisible_captcha only: [:create, :update]
  # load_and_authorize_resource
  # GET /enquiries
  # GET /enquiries.json

  def responded_to
    @enquiry.update_attributes(responded_to: true)
    redirect_to enquiries_path
  end

  def index
    @enquiries = Enquiry.most_recent.paginate(:page => params[:page], :per_page => 15)
    authorize! :read, @enquiries
  end

  # GET /enquiries/1
  # GET /enquiries/1.json
  def show
    authorize! :read, @enquiry
  end

  # GET /enquiries/new
  def new
    @enquiry = Enquiry.new
  end

  # POST /enquiries
  # POST /enquiries.json
  def create
    @enquiry = Enquiry.new(enquiry_params)

    respond_to do |format|
      if @enquiry.save
        @enquiry.send_emails
        format.html { redirect_to thanks_path(enquiry: @enquiry.id), notice: 'Your enquiry has been received.' }
        format.json { render :show, status: :created, location: @enquiry }
      else
        format.html { render :new }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enquiries/1
  # PATCH/PUT /enquiries/1.json
  # def update
  #   respond_to do |format|
  #     if @enquiry.update(enquiry_params)
  #       format.html { redirect_to @enquiry, notice: 'Enquiry was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @enquiry }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @enquiry.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /enquiries/1
  # DELETE /enquiries/1.json
  def destroy
    @enquiry.destroy
    respond_to do |format|
      format.html { redirect_to enquiries_url, notice: 'Enquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enquiry_params
      params.require(:enquiry).permit(:enquiry_type_id, :first_name, :last_name, :company, :phone, :email, :message, :responded_to, :user_id)
    end
end

class IotdevicesController < ApplicationController
  before_action :set_iotdevice, only: [:show, :edit, :update, :destroy, :vote]

  # GET /iotdevices
  # GET /iotdevices.json
  def index
    @iotdevices = Iotdevice.all
  end

  # GET /iotdevices/1
  # GET /iotdevices/1.json
  def show
  end

  # GET /iotdevices/new
  def new
    @iotdevice = Iotdevice.new
  end

  # GET /iotdevices/1/edit
  def edit
  end

  # POST /iotdevices
  # POST /iotdevices.json
  def create
    @iotdevice = Iotdevice.new(iotdevice_params)

    respond_to do |format|
      if @iotdevice.save
        format.html { redirect_to @iotdevice, notice: 'Iotdevice was successfully created.' }
        format.json { render :show, status: :created, location: @iotdevice }
      else
        format.html { render :new }
        format.json { render json: @iotdevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iotdevices/1
  # PATCH/PUT /iotdevices/1.json
  def update
    respond_to do |format|
      if @iotdevice.update(iotdevice_params)
        format.html { redirect_to @iotdevice, notice: 'Iotdevice was successfully updated.' }
        format.json { render :show, status: :ok, location: @iotdevice }
      else
        format.html { render :edit }
        format.json { render json: @iotdevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iotdevices/1
  # DELETE /iotdevices/1.json
  def destroy
    @iotdevice.destroy
    respond_to do |format|
      format.html { redirect_to iotdevices_url, notice: 'Iotdevice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @iotdevice.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iotdevice
      @iotdevice = Iotdevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iotdevice_params
      params.require(:iotdevice).permit(:manufacturer_id, :user_id, :product_url, :updates_url, :base_version)
    end
end

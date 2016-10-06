class FirmwaresController < ApplicationController
  before_action :set_firmware, only: [:show, :edit, :update, :destroy]

  # GET /firmwares
  # GET /firmwares.json
  def index
    @firmwares = Firmware.all
  end

  # GET /firmwares/1
  # GET /firmwares/1.json
  def show
  end

  # GET /firmwares/new
  def new
    @firmware = Firmware.new
  end

  # GET /firmwares/1/edit
  def edit
  end

  # POST /firmwares
  # POST /firmwares.json
  def create
    @firmware = Firmware.new(firmware_params)

    respond_to do |format|
      if @firmware.save
        format.html { redirect_to @firmware, notice: 'Firmware was successfully created.' }
        format.json { render :show, status: :created, location: @firmware }
      else
        format.html { render :new }
        format.json { render json: @firmware.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firmwares/1
  # PATCH/PUT /firmwares/1.json
  def update
    respond_to do |format|
      if @firmware.update(firmware_params)
        format.html { redirect_to @firmware, notice: 'Firmware was successfully updated.' }
        format.json { render :show, status: :ok, location: @firmware }
      else
        format.html { render :edit }
        format.json { render json: @firmware.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firmwares/1
  # DELETE /firmwares/1.json
  def destroy
    @firmware.destroy
    respond_to do |format|
      format.html { redirect_to firmwares_url, notice: 'Firmware was successfully destroyed.' }
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

    @firmware.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firmware
      @firmware = Firmware.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firmware_params
      params.require(:firmware).permit(:iotdevice_id, :download_url, :version, :name, :readme_url, :readme_title, :readme_description, :enabled, :requirements)
    end
end

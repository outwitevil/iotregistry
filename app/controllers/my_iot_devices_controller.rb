class MyIotDevicesController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_my_iot_device, only: [:show, :edit, :update, :destroy]

  # GET /my_iot_devices
  # GET /my_iot_devices.json
  def index
    @my_iot_devices = MyIotDevice.all
  end

  # GET /my_iot_devices/1
  # GET /my_iot_devices/1.json
  def show
  end

  # GET /my_iot_devices/new
  def new
    @my_iot_device = MyIotDevice.new
  end

  # GET /my_iot_devices/1/edit
  def edit
  end

  # POST /my_iot_devices
  # POST /my_iot_devices.json
  def create
    @my_iot_device = MyIotDevice.new(my_iot_device_params)
    @my_iot_device.user = current_user

    respond_to do |format|
      if @my_iot_device.save
        format.html { redirect_to @my_iot_device, notice: 'My iot device was successfully created.' }
        format.json { render :show, status: :created, location: @my_iot_device }
      else
        format.html { render :new }
        format.json { render json: @my_iot_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_iot_devices/1
  # PATCH/PUT /my_iot_devices/1.json
  def update
    respond_to do |format|
      if @my_iot_device.update(my_iot_device_params)
        format.html { redirect_to @my_iot_device, notice: 'My iot device was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_iot_device }
      else
        format.html { render :edit }
        format.json { render json: @my_iot_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_iot_devices/1
  # DELETE /my_iot_devices/1.json
  def destroy
    @my_iot_device.destroy
    respond_to do |format|
      format.html { redirect_to my_iot_devices_url, notice: 'My iot device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_iot_device
      @my_iot_device = MyIotDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_iot_device_params
      params.require(:my_iot_device).permit(:iotdevice_id, :user_id, :ipv4_address, :installed_firmware_version)
    end
end

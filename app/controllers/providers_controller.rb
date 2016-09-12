require 'readXlsManager/read_xls_manager'
require 'providerManager/provider_manager'
require 'productManager/product_manager'
require 'utilities/s3_asset_service'

class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  def multi
  end

  def save
    @readXls = ReadXlsManager.instance
    @providerManager = ProviderManager.new
    @productManager = ProductManager.new
    resultProviders = @readXls.readExcel(params['providers'].tempfile)
    resultProducts = @readXls.readExcel(params['products'].tempfile)
    @providerList = @providerManager.createProviders(resultProviders)
    @productManager.createProduct(resultProducts)
    @providerList
  end


  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
    @address = Address.new(address_params)
    @address.save
    @provider.address = @address
    @user = User.find(current_user.id)
    @provider.user = current_user
    respond_to do |format|
      if @provider.save
        current_user.provider = @provider
        current_user.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        @address.rollback
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_image
    @s3AssetService = S3AssetService.instance
    result_image = @s3AssetService.upload_image_to_s3(params)
    @s3_asset = @s3AssetService.save_image_s3_asset("http://com.agroonline.s3.amazonaws.com/#{result_image.key}", result_image.key)
    @provider = Provider.find(params[:id_provider])
    @provider.s3_asset = @s3_asset
    @provider.save
    @provider
    render "show"
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name,:lastName,:telephone,:user_type)
    end

    def address_params
      params.permit(:street, :street_number, :suite, :zip_code, :colony, :country, :city, :town, :federal_entity)
    end
end

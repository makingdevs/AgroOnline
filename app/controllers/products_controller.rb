require 'utilities/unidades'
require 'utilities/s3_asset_service'

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_unidades, only: [:show, :contact]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def contact
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @provider = Provider.find params[:id]
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    create_tags params[:categorias]
    @provider = Provider.find params[:provider_id]
    @product.provider = @provider
    respond_to do |format|
      if @product.save
        @provider.products << @product
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def providerProducts
    @provider = Provider.find(params[:id])
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @products = Product.where(:origin => params[:id].downcase)
    @products
    render 'index'
  end

  def image
    @s3AssetService = S3AssetService.instance
    result_image = @s3AssetService.upload_image_to_s3(params)
    @s3_asset = @s3AssetService.save_image_s3_asset("http://com.agroonline.s3.amazonaws.com/#{result_image.key}", result_image.key)
    @product = Product.find params[:id_product]
    @product.s3_assets << @s3_asset
    @product.save
    redirect_to  action:"show", id: @product.id
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name,:price,:weight,:min_order_quantity)
    end

    def set_unidades
      @unidades = Unidades.unidades
    end

    def create_tags(string_tags)
      tags = string_tags.split(",")
      tags.each do | name |
        tag = Tag.new()
        tag.name = name
        tag.save
        @product.tags << tag
      end
    end

end

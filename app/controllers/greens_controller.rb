class GreensController < ApplicationController
  
  def index
  end
  
  def show
    @green = Green.find(params[:id])
  end
  
  def new
    @green = Green.new
  end
  
  def edit
  end
  
  def create
    @green = @product.create_green(green_params)

    respond_to do |format|
      if @green.save
        format.html { redirect_to 'show', notice: 'Product was successfully created.' }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new', controller: 'user' }
        format.json { render json: @green.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @green.update(green_params)
        format.html { redirect_to 'show', notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @green.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @green.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def green_params
      params.require(:green).permit(:name, :description, :type, :strain, :thc, :image_url,
          :link, :quantity, :inventory, :ppgram, :ppeighth, :ppquad, :pphalf, :ppoz )
    end
end

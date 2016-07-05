class AddressesController < ApplicationController
  def index
  
    @addresses=current_user.addresses
    # flash[:notice] = "Select your Shipping or Billing addresses #{params[:output_flash=>"select_address"]}."
  end
  
  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create

    @address = Address.new(address_params)
    @address.user=current_user
    if @address.save
      flash[:notice] = "Address was successfully created."
      redirect_to addresses_path
    else 
      render 'new'
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "Address was successfully updated."
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "Address was removed successfully."
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit!
  end
end
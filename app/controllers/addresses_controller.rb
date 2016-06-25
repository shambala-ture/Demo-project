class AddressesController < ApplicationController
  def index
    @addresses=current_user.addresses
    # @users=User.last
    # @users.id
  end
  def show
    @addresses = Address.find(params[:id])
  end

  def new
    @addresses = Address.new
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def create
    @addresses = Address.new(params[:address])
    
    if @addresses.save
      redirect_to @addresses
    else 
      render 'new'
    end
  end

  def update
    @addresses = Address.find(params[:id])
    if @addresses.update(params[:address])
      redirect_to @addresses
    else
      render 'edit'
    end
  end

  def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
   
    redirect_to addresses_path
  end

# private
#   def address_params
#     params.require(:address).permit(:name, :address_1)
#   end
end

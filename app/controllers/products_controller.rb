class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, except: [:index]
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    
    def index
    @products = Product.all
    #@products = @products.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10 )
    #@products = Product.paginate(page: params[:page], per_page: 10)

    end
    
    def show
    end
    
    def new
    @product = Product.new  
    end    
    
    def create
    @product = Product.new(product_params)
    @product.user = current_user
      if @product.save
        redirect_to products_path
      else
        render :new
      end
    end
  
    
    def edit
      
    end
    
    def update
    if @product.user == current_user && @product.update(product_params)
      redirect_to products_path
    else
      flash[:alert] = "Impossible de modifier"
      render :edit
    end
    end
    

    def destroy
    if @product.user == current_user
      @product.destroy                      # on le supprime
      redirect_to products_path             # on redirige vers index
    else
      flash[:alert] = "Action impossible, Vous n'avez pas créé cet événement. Mais vous pouvez en créer un autre dans le formulaire ci-dessous :"
        redirect_to products_path   
    end  
    end

   
    private
    
    def find_product
    @product = Product.find(params[:id])
    end
    
    #def product_params
    #params.require(:product).permit(:title, :content, :user_id, :user_id_attr)
    #end
    def product_params 
      params.require(:product).permit( :title, :content, :user_id)
      #:user_id => [:name]
      #params.require(:user).permit(:email, :name)
    end

   
end

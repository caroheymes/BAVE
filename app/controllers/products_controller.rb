class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, except: [:index]
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    
    def index
    @products = Product.all
    #@products = @products.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10 )

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
      if @product.save && @product.user = current_user
        redirect_to products_path
      else
        render :new
      end
    end

    def update
    if @product.update(product_params) && @product.user == current_user       # 2
      redirect_to products_path             # 3
    else
      flash[:alert] = "Action impossible, Vous n'avez pas créé cet événement. Mais vous pouvez en créer un autre dans le formulaire ci-dessous :"
      render :edit                          # 4
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
    
    def product_params
    params.require(:product).permit(:title, :content)
    end
    
    #def current_user?
    #if @product.user != current_user
    #    flash[:alert] = "Vous n'avez pas créé cet événement, vous ne pouvez pas le modifier"
    #    redirect_to products_path
    #end
    #end
   
end

class ProductsController < ApplicationController
  def export
    @products = Product.all
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet(name:'Products')
    Product.find_each.with_index(1) do |product, index|
      sheet.row(index).concat [product.title, product.description]
    end
    headers['Content-Type'] = 'application/vnd.ms-excel'
    headers['Content-Disposition'] = 'attachment; filename="products.xls"'
    output = StringIO.new
    book.write output
    send_data output.string, filename: 'products.xls'
  end

  def index
      @products = Product.all
  end   

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  def create
    product = Product.create(product_params)
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_path
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def  product_params
    params.require(:product).permit(:title, :description,:image)
  end
end

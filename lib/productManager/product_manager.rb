class ProductManager

  def createProduct(paramsProduct)
    products = []
    paramsProduct.each { | productRow |
      category = Category.find_by name: "#{productRow[7]}"
      provider = Provider.find_by nickname: "#{productRow[8]}"
      if category && provider
        product = Product.createProduct(productRow,category)
        product.provider = provider
        product.save
        products << product
      end
    }
    products
  end

end

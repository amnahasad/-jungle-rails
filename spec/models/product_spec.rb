require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it 'for all products with all four fields set will save successfully' do
      @category = Category.create(name: "Electronics")
      @product = Product.create(
        name: "electric pencil sharpener", 
        price: 400,
        quantity: 4, 
        category: @category
      )
        expect(@product).to be_persisted
    end

    it 'is not valid without a name' do
      @category = Category.create(name: "Electronics")
      @product = Product.create(
        name: nil, 
        price: 400,
        quantity: 4, 
        category: @category
      )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.create(name: "Electronics")
      @product = Product.create(
        name: "electric pencil sharpener", 
        price: nil,
        quantity: 4, 
        category: @category
      )
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @category = Category.create(name: "Electronics")
      @product = Product.create(
        name: "electric pencil sharpener", 
        price: 400,
        quantity: nil, 
        category: @category
      )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @category = Category.create(name: "Electronics")
      @product = Product.create(
        name: "electric pencil sharpener", 
        price: 400,
        quantity: 4, 
        category: nil
      )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

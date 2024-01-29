require 'rails_helper'



RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'has valid name' do
      category = Category.find(1)
      product = Product.new(
        name: "Test",
        description: "Example",
       price_cents: 1999,
        category_id: category.id,
        quantity: 2)
      expect(product).to be_valid
    end

    it 'has valid name' do
      category = Category.find(1)
      product = Product.new(
        name: "Test",
        description: "Example",
       price_cents: 1999,
        category_id: category.id,
        quantity: 2)
      expect(product.name).to be_present
    end

    it 'has validprice_cents' do
      category = Category.find(1)
      product = Product.new(
        name: "Test",
        description: "Example",
       price_cents: 1999,
        category_id: category.id,
        quantity: 2)
      expect(product.price).to be_present
    end

    it 'has valid quantity' do
      category = Category.find(1)
      product = Product.new(
        name: "Test",
        description: "Example",
       price_cents: 1999,
        category_id: category.id,
        quantity: 2)
      expect(product.price).to be_present
    end

    it 'has valid quantity' do
      category = Category.find(1)
      product = Product.new(
        name: "Test",
        description: "Example",
       price_cents: 1999,
        category_id: category.id,
        quantity: 2)
      expect(product.category).to be_present
    end

    it 'validates presence of no name' do
      category = Category.find(1)
      product = Product.new(
        name: nil,
        description: "Example",
       price_cents: 1999,
        category_id: category.id,
        quantity: 2)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates presence of noprice_cents' do
      category = Category.find(1)
      product = Product.new(
        name: "test",
        description: "example",
       price_cents: nil,
        category_id: category.id,
        quantity: 2)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates presence of no quantity' do
      category = Category.find(1)
      product = Product.new(
        name: "test",
        description: "example",
       price_cents: 1999,
        category_id: category.id,
        quantity: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates presence of no category' do
      category = Category.find(1)
      product = Product.new(
        name: "test",
        description: "example",
       price_cents: 1999,
        category_id: nil,
        quantity: 1)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

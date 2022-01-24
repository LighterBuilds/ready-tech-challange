require './app/product'
require './app/basket'
require 'byebug'

RSpec.describe Basket do
  before(:all) do
    @book = Product.new('Book', 12.49, 'Book')
    @music_cd = Product.new('music cd', 14.99, 'music cd')
    @imported_chocolate = Product.new('imported box of chocolates', 10.00, 'food', true)
    @imported_perfume = Product.new('imported bottle of perfume', 47.50, 'perfume', true)
  end

  context 'When basket contains products' do
    before(:all) do
      @basket = Basket.new
      @basket.add_product(@book)
      @basket.add_product(@music_cd)
      @basket.add_product(@imported_chocolate)
      @basket.add_product(@imported_perfume)
    end

    it 'calculates total taxes' do
      expect(@basket.total_taxes).to eq('9.15')
    end

    it 'calculates total price including tax' do
      expect(@basket.total_price_after_taxes).to eq('94.13')
    end
  end

  context 'When basket contains no products' do
    before(:all) do
      @basket = Basket.new
    end

    it 'should return 0 when trying to calculate taxes' do
      expect(@basket.total_taxes).to eq('0.00')
    end

    it 'should return 0 when trying to calculate total price after tax' do
      expect(@basket.total_price_after_taxes).to eq('0.00')
    end
  end
end

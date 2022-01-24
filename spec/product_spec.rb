require './app/product'
require 'byebug'

RSpec.describe Product do
  describe 'Taxes' do
    context 'Non-imported products' do
      context 'All taxes exempt' do
        it 'should not apply basic tax when product is a book' do
          book = Product.new('Book', 24.49, 'Book')
          expect(book.tax).to eq(0)
          expect(book.price_after_taxes).to eq(24.49)
        end

        it 'should not chapply basicarge tax when product is a food' do
          chocolate_bar = Product.new('Chocolate Bar', 9.99, 'Food')
          expect(chocolate_bar.tax).to eq(0)
          expect(chocolate_bar.price_after_taxes).to eq(9.99)
        end

        it 'should not apply basic tax when product is a medication' do
          headache_pills = Product.new('Headache Pills', 12.49, 'Medication')
          expect(headache_pills.tax).to eq(0)
          expect(headache_pills.price_after_taxes).to eq(12.49)
        end
      end

      context 'Basic sales taxes applied' do
        it 'should apply basic tax non tax excempt products - rouding up the price' do
          perfume = Product.new('Locally Produced Perfume', 18.99, 'perfume')
          expect(perfume.tax).to eq(1.9)
          expect(perfume.price_after_taxes).to eq(20.89)
        end

        it 'should apply basic tax non tax excempt products - rouding down the price' do
          perfume = Product.new('Locally Produced Perfume', 10.01, 'perfume')
          expect(perfume.tax).to eq(1.05)
          expect(perfume.price_after_taxes).to eq(11.06)
        end
      end
    end

    context 'Imported products' do
      context 'Basic sales tax exempt' do
        it 'should charge import duty tax even when product is a book' do
          book = Product.new('Book', 24.49, 'Book', true)
          expect(book.tax).to eq(1.25)
          expect(book.price_after_taxes).to eq(25.74)
        end

        it 'shouldcharge import duty tax even when product is a food' do
          chocolate_bar = Product.new('Chocolate Bar', 9.99, 'Food', true)
          expect(chocolate_bar.tax).to eq(0.5)
          expect(chocolate_bar.price_after_taxes).to eq(10.49)
        end

        it 'should charge import duty tax even when product is a medication' do
          headache_pills = Product.new('Headache Pills', 12.49, 'Medication', true)
          expect(headache_pills.tax).to eq(0.65)
          expect(headache_pills.price_after_taxes).to eq(13.14)
        end
      end

      context 'Basic sales taxes applied' do
        it 'should also apply import duty taxes on imported product - rouding up the price' do
          perfume = Product.new('Locally Produced Perfume', 27.99, 'perfume', true)
          expect(perfume.tax).to eq(4.2)
          expect(perfume.price_after_taxes).to eq(32.19)
        end

        it 'should also apply import duty taxes on imported product - rouding down the price' do
          perfume = Product.new('Locally Produced Perfume', 47.50, 'perfume', true)
          expect(perfume.tax).to eq(7.15)
          expect(perfume.price_after_taxes).to eq(54.65)
        end
      end
    end
  end

  it 'should assign product name correctly and allow read access' do
    perfume = Product.new('Locally Produced Perfume', 47.50, 'perfume')
    expect(perfume.name).to eq('Locally Produced Perfume')
  end
end

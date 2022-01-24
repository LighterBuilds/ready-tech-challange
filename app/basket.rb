class Basket
  def initialize
    @products = []
    @total_tax = 0
    @total_price = 0
    @total_import_duty = 0
  end

  def add_product(product)
    @products << product
  end

  def total_taxes
    calculate_total_taxes

    format_price_for_printing(@total_tax)
  end

  def total_price_after_taxes
    @total_price = 0

    @products.each do |product|
      @total_price += product.price_after_taxes
    end

    @total_price = @total_price.round(2)

    format_price_for_printing(@total_price)
  end

  def print_receipt
    @products.each do |product|
      formated_price = format_price_for_printing(product.price_after_taxes)
      puts "1, #{product.name}, #{formated_price}"
    end

    puts
    puts "Sales Taxes -- #{total_taxes}"
    puts "Total -------- #{total_price_after_taxes}"
  end

  private

  def calculate_total_taxes
    # Reset "@total_tax" in case it's already set.
    @total_tax = 0

    @products.each do |product|
      @total_tax += product.tax
    end

    @total_tax = (@total_tax * 20.00).round / 20.00
  end

  def format_price_for_printing(price)
    # Converts @total_tax to a string that's 2 decimal places. Example - 10.0 to "10.00".
    format('%.2f', price)
  end
end

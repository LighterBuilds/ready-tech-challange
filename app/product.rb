class Product
  attr_accessor :name

  def initialize(name, price, product_type = nil, imported = false)
    @name = name
    @price = price
    @product_type = product_type
    @tax = nil
    @imported = imported
  end

  TAX_FREE_PRODUCT_TYPES = %w[book food medication].freeze

  def tax
    # Set tax if it hasn't been set.
    set_taxes if @tax.nil?

    @tax
  end

  def price_after_taxes
    tax_price = @price + tax
    tax_price.round(2)
  end

  private

  def set_taxes
    # Flags that "set_taxes" has been called and "@tax" is set.
    @tax = 0

    # Adds a 10% tax for taxable products.
    set_gst
    # Adds a 5% import tax for imported products.
    set_import_duty_tax

    @tax = @tax.round(2)
  end

  def set_gst
    @tax += round_up_to_the_nearest_five_cent(0.10) if product_is_taxable?
  end

  def set_import_duty_tax
    @tax += round_up_to_the_nearest_five_cent(0.05) if @imported
  end

  def product_is_taxable?
    return false if TAX_FREE_PRODUCT_TYPES.include?(@product_type.downcase)

    true
  end

  def round_up_to_the_nearest_five_cent(percent)
    (@price * percent * 20).ceil / 20.00
  end
end

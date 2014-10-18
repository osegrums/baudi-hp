module BedsHelper
  def bed_prices_for_data(bed)
    bed.bed_prices.map do |bed_price|
      {
        id:             bed_price.id,
        has_decoration: bed_price.has_decoration,
        has_rack:       bed_price.has_rack,
        dimension_id:   bed_price.dimension_id,
        price:          bed_price.price
      }
    end
  end

  def bed_kit_prices_for_data(bed)
    bed.kit_prices.map do |kit_price|
      {
        id:             kit_price.id,
        kit_id:         kit_price.kit_id,
        dimension_id:   kit_price.dimension_id,
        price:          kit_price.price
      }
    end
  end
end

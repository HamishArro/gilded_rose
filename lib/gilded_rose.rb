class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= @quality_change = 1
        modify_quality_change(item)
        quality_miltiplier(item)
        check_quality(item)
      end
    end
  end

  def modify_quality_change(item)
    if positive_degrade?(item)
      backstage?(item)
      @quality_change *= -1
    end
  end

  def positive_degrade?(item)
    item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def backstage?(item)
    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      if item.sell_in <= 0 then item.quality = @quality_change = 0
      elsif item.sell_in <= 5 then @quality_change += 2
      elsif item.sell_in <= 10 then @quality_change += 1 end
    end
  end

  def quality_miltiplier(item)
    if item.sell_in <= 0 || item.name.downcase.include?('conjured')
      item.sell_in <= 0 && item.name.downcase.include?('conjured') ? @quality_change *= 4 : @quality_change *= 2
    end
  end

  def check_quality(item)
    if item.quality - @quality_change > 50 then item.quality = 50
    elsif item.quality - @quality_change < 0 then item.quality = 0
    else item.quality -= @quality_change end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

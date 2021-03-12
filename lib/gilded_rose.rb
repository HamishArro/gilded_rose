class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality() #def

    @items.each do |item| #each
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
        if !(item.quality <= 0 || item.quality >= 50) || item.name == "Aged Brie"
          quality_change = 1
          if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.name == "Backstage passes to a TAFKAL80ETC concert"
              if item.sell_in <= 0
                item.quality = 0
                quality_change = 0
              elsif item.sell_in <= 5
                quality_change += 2
              elsif item.sell_in <= 10
                quality_change += 1
              end
            end
            quality_change *= -1
          end
          if item.sell_in <= 0
            quality_change *= 2
          end
          item.quality - quality_change > 50 ? item.quality = 50 : item.quality -= quality_change
        end
      end
      # if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      #   if item.quality > 0
      #     if item.name != "Sulfuras, Hand of Ragnaros"
      #       item.quality -= 1
      #     end
      #   end
      # elsif item.quality < 50
      #   item.quality += 1
      #   if item.name == "Backstage passes to a TAFKAL80ETC concert"
      #     if item.sell_in < 11
      #       if item.quality < 50
      #         item.quality += 1
      #       end
      #     end
      #     if item.sell_in < 6
      #       if item.quality < 50
      #         item.quality += 1
      #       end
      #     end
      #   end
      # end
      #
      # if item.name != "Sulfuras, Hand of Ragnaros"
      #   item.sell_in -= 1
      # end
      #
      # if item.sell_in < 0
      #   if item.name != "Aged Brie"
      #     if item.name != "Backstage passes to a TAFKAL80ETC concert"
      #       if item.quality > 0
      #         if item.name != "Sulfuras, Hand of Ragnaros"
      #           item.quality -= 1
      #         end
      #       end
      #     else
      #       item.quality -= item.quality
      #     end
      #   elsif item.quality < 50
      #     item.quality += 1
      #   end
      # end

    end #each

  end #def

end #class


#-------------- do not touch --------------
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

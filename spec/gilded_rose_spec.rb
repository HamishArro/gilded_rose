require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it " [normal] changes the quality by -1" do
      items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 19
    end

    it " [Brie] changes the quality by +1" do
      items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it " [Backstage] changes the quality by +1 when sell_in = 15" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 21
    end

    it " [Backstage] changes the quality by +2 when sell_in = 10" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 22
    end

    it " [Backstage] changes the quality by +3 when sell_in = 5" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 23
    end
  end

end

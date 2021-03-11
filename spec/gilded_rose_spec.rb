require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    describe '[normal]' do

      it "the quality of an item is never negative" do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=5, quality=0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq 4
      end

      it "changes the quality by -1" do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 19
        expect(items[0].sell_in).to eq 9
      end

      it "changes quality x2 as much when sell_in is < 0" do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=0, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 18
        expect(items[0].sell_in).to eq -1
      end

    end

    describe '[Brie]' do

      it "changes the quality by +1" do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 1
        expect(items[0].sell_in).to eq 1
      end

      it "changes the quality by +2 when sell_in date is reached" do
        items = [Item.new(name="Aged Brie", sell_in=0, quality=0)]
        26.times {GildedRose.new(items).update_quality()}
        expect(items[0].quality).to eq 50
        expect(items[0].sell_in).to eq -26
      end

      it "changes the quality by +2 till it reaches 50" do
        items = [Item.new(name="Aged Brie", sell_in=0, quality=0)]
        26.times {GildedRose.new(items).update_quality()}
        expect(items[0].quality).to eq 50
        expect(items[0].sell_in).to eq -26
      end

    end

    describe '[Backstage]' do

      it "changes the quality by +1 when sell_in = 15" do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 21
        expect(items[0].sell_in).to eq 14
      end

      it "changes the quality by +2 when sell_in = 10" do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 22
        expect(items[0].sell_in).to eq 9
      end

      it "changes the quality by +3 when sell_in = 5" do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 23
        expect(items[0].sell_in).to eq 4
      end

      it "changes the quality to 0 when sell_in = 0" do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq -1
      end

    end

    describe '[Sulfuras]' do

      it "unchanged when sell_in = 0" do
        items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
      end

      it "unchanged when sell_in = -1" do
        items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
        expect(items[0].sell_in).to eq -1
      end

    end
  end

end

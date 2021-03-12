# Gilded rose tech test

* changes were only made to UpdateQuality, the goblin in the corner will not insta rage.

## Installation

1. download repo from Github
2. cd into the repo `$ cd gilded_rose` - unless it has been renamed
3. run bundle from the command line `$ bundle`
4. run 'gilded_rose.rb' from the command line using IRB `$ irb -r ./lib/gilded_rose`

## Use
* make an array of items i.e:
  `items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Item.new(name="Aged Brie", sell_in=2, quality=0)]`
* make a new object using the GildedRose class i.e:
  `gilded_rose = GildedRose.new items`
* then use `gilded_rose.update_quality` to update the quality of the items.
* or alter the list of items found on 'texttest_fixture.rb' and run in the terminal using `$ ruby ./lib/texttest_fixture.rb`.
  - you can alter the number of days you'd like by changing the number on line 18.

## Planning
- use tests to refactor code, this will ensure it is not being broken.
### Breakdown (sudo code)
- used to redesign logic
1. if sell_in < 0 -> degrade x 2
2. if quality =< 0 -> quality is unchanged
3. if item.name == 'Aged brie' -> + quality
4. if quality => 50 -> quality is unchanged
5. if item.name == 'sulfra' -> nothing changes
6. if item.name == 'backstage' ->
  - if sell_in =< 0 -> quality = 0
  - if sell_in =< 5 -> quality += 3
  - if sell_in =< 10 -> quality += 2



## Test
This is a well known kata developed by [Terry Hughes](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a `SellIn` value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s `SellIn` value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the `UpdateQuality` method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the `UpdateQuality` method and Items property static if you like, we’ll cover for you)."*

## The brief:

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

HINT: Test first FTW!

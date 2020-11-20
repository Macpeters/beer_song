# frozen_string_literal: true

class BeerSong
  def verses(verse_a, verse_b)
    if verse_a > verse_b
      first_verse = verse_b
      last_verse = verse_a
    else
      first_verse = verse_a
      last_verse = verse_b
    end

    verses_string = ''
    verse_list = (first_verse..last_verse).to_a

    verse_list.sort.reverse.each_with_index do |verse, index|
      verses_string += "#{verse(verse)}\n"
    end
    verses_string.chomp
  end

  def verse(verse_number)
    first_verse_line(verse_number) + second_verse_line(verse_number)
  end

  def first_verse_line(verse_number)
    return final_first_line = "No more bottles of beer on the wall, no more bottles of beer.\n" if verse_number.zero?

    "#{verse_number} #{bottle_or_bottles(verse_number)} of beer on the wall, #{verse_number} #{bottle_or_bottles(verse_number)} of beer.\n"
  end

  def second_verse_line(verse_number)
    new_number = new_bottle_number(verse_number)
    this_bottle = verse_number.to_i == 1 ? 'it' : 'one'
    if verse_number.zero?
      return "Go to the store and buy some more, #{new_number} #{bottle_or_bottles(new_number)} of beer on the wall.\n"
    end
      second_line = "Take #{this_bottle} down and pass it around, #{new_number} #{bottle_or_bottles(new_number)} of beer on the wall.\n"
  end

  def new_bottle_number(verse_number)
    new_number = (verse_number - 1).to_s
    new_number = 'no more' if new_number.to_i.zero?
    new_number = 99 if new_number.to_i < 0
    new_number
  end

  def bottle_or_bottles(number)
    return 'bottles' if number == 'no more'

    number.to_i > 1 ? 'bottles' : 'bottle'
  end
end

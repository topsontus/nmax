#!/usr/bin/env ruby

class Nmax
  attr_reader :list, :count

  def initialize(count)
    @list = []
    @count = count.to_i
  end

  def call
    return if count == 0

    $stdin.each_line do |line|
      numbers = line.scan(/-?\d+/).map(&:to_i)
      next if numbers.empty?

      numbers.each do |number|
        next list.push(number) if list.empty?

        binary_push(number)
      end
    end

    p list
  end

  def binary_push(number)
    first, last = [0, list.length - 1]

    while first <= last
      mid = (first + last) / 2
      guess = list[mid]

      after_guess = list[mid + 1] || number
      before_guess = (mid <= 0 ? nil : list[mid]) || number

      if number == guess || number.between?(guess, after_guess)
        return insert(mid + 1, number)
      elsif number.between?(before_guess, guess)
        return insert(mid, number)
      elsif guess > number
        last = mid - 1
      else
        first = mid + 1
      end
    end
  end

  def insert(index, number)
    list.insert(index, number)
    list.shift if list.length > count
    list
  end
end

if $PROGRAM_NAME == __FILE__
  Nmax.new(ARGV.first).call
end

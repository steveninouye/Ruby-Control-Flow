# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
    str.each_char do |ltr|
        str.delete! ltr if ltr == ltr.downcase
    end
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
    lgth = str.length
    return str[(lgth/2).floor] if lgth % 2 == 1
    mdl = lgth / 2
    str[mdl - 1] + str[mdl]
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
    str.count "aeiou"
end

# Return the factorial of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
    result = 1
    while num > 1
        result *= num
        num -= 1
    end
    result
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
    result = ""
    arr.each_with_index do |el, idx|        
        result += separator if idx != 0
        result += el
    end
    result
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
    num = str.downcase!.length
    num -= 1 if num % 2 == 0
    while num > 0
        str[num] = str[num].upcase
        num -=2
    end
    str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
    str_arr = str.split
    str_arr.each_with_index do |el, idx|
        str_arr[idx] = el.reverse if el.length >=5
    end
    str_arr.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
    result = []
    i = 1
    while i <= n
        if i % 3 == 0 && i % 5 == 0
            result.push("fizzbuzz")
        elsif i % 5 == 0
            result.push("buzz")
        elsif i % 3 == 0
            result.push("fizz")
        else
            result.push(i)
        end
        i += 1
    end
    result
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
    last_idx = arr.length - 1
    result = []
    (0..last_idx).each do |x|
        result.push(arr[last_idx - x])
    end
    result
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
    return false if num < 2
    x = (num / 2).floor
    while x > 1
        return false if num % x == 0
        x -= 1
    end
    true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
    result = []
    i = 1
    while i <= num
        result.push(i) if num % i == 0
        i += 1
    end
    result
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
    arr = factors(num)
    arr.delete_if { |num| !prime?(num)}
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
    prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
    evens = []
    odds = []
    idx = 0
    until (evens.length == 1 || odds.length == 1) && (evens.length >= 2 || odds.length >= 2) 
        evens.push(arr[idx]) if arr[idx].even?
        odds.push(arr[idx]) if arr[idx].odd?
        idx += 1
    end
    if odds.length == 1 then odds[0] else evens[0] end
end

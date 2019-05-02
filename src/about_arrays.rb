require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal __(Array), empty_array.class
    assert_equal __(0), empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array # __

    array[0] = 1
    assert_equal [1], array     # __

    array[1] = 2
    assert_equal [1, __(2)], array

    array << 333
    assert_equal __([1, 2, 333]), array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __(:peanut), array[0]
    assert_equal __(:peanut), array.first
    assert_equal __(:jelly), array[3]
    assert_equal __(:jelly), array.last
    assert_equal __(:jelly), array[-1]
    assert_equal __(:butter), array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __([:peanut]), array[0,1]
    assert_equal __([:peanut, :butter]), array[0,2]
    assert_equal __([:and, :jelly]), array[2,2]
    assert_equal __([:and, :jelly]), array[2,20]
    assert_equal __([]), array[4,0]
    assert_equal __([]), array[4,100]
    assert_equal __(nil), array[5,0]
  end

  def test_different_methods_to_return_values_in_an_array
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __([:peanut]), array[0,1]
    assert_equal __(:peanut), array[0]
    assert_equal __([]), array[4,0]
    assert_equal __(nil), array[4]
    assert_equal __([]), array[4,2]
    assert_equal __([]), array[3,0]
    assert_equal __([:jelly]), array[3,1]
  end

  # TO THINK ABOUT IT

  # When we retrieve the character placed in an exact position in an array, the
  # Index works as usual. But when we call the method [] to slice
  # (array[start,interval length]), the coordenates of start don't
  # work as the usual Index, it separates each part of the array, including
  # the brackets.
  # So, if we requested array[4,0], we would still be in the array (the bracket
  # position) and it would return an empty array ('[]').

  # Index in an array       0   1   2   3   4
  # Array                 [ 1 , 2 , 3 , 4 ]
  # Range    [(Start ind  0   1   2   3   4   5...),   interval length]


  def test_arrays_and_ranges
    assert_equal __(Range), (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5) # __
    assert_equal __([1,2,3,4,5]), (1..5).to_a
    assert_equal __([1,2,3,4]), (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __([:peanut, :butter, :and]), array[0..2]
    assert_equal __([:peanut, :butter]), array[0...2]
    assert_equal __([:and, :jelly]), array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal __([1, 2, :last]), array

    popped_value = array.pop
    assert_equal __(:last), popped_value
    assert_equal __([1, 2]), array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal __([:first, 1, 2]), array

    shifted_value = array.shift
    assert_equal __(:first), shifted_value
    assert_equal __([1, 2]), array
  end

  def test_array_substraction
    array = [1,2,3,4,5]
    another_array = [2]

    assert_equal __([1,3,4,5]), array - another_array
  end

  def test_substracting_multiple_array_values
    array = [1,2,2,3,3,4,5]
    another_array = [2,2,3,3]

    assert_equal __([1,4,5]), array - another_array
  end

  def test_how_array_substraction_really_work
    array = [2,3,4,5,6,2,7,2]
    another_array = [2]

    assert_equal __([3,4,5,6,7]), array - another_array
  end

  def test_substracting_multiple_values_from_arrays
    array = [1,2,2,3,3,4,5,6,2,3,7]
    another_array = __([2,3])

    assert_equal 2, another_array.size , "'another_array' should have two elements"
    assert_equal  [1,4,5,6,7], array - another_array
  end

end

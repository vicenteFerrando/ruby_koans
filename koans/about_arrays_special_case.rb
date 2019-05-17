require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArraysSpecialCase < Neo::Koan
  def test_array_is_zero_base_indexed
    array = [:first, :second, :third]
    assert_equal :first, array[0]
    assert_equal :third, array[2]
  end

  def test_out_of_range_position_returns_nil
    array = [:first, :second, :third]
    assert_equal nil, array[3]
    assert_equal nil, array[10]
  end

  def test_out_of_range_slice_returns_empty_array
    array = [:first, :second, :third]
    assert_equal [], array[3, 1]
    assert_equal [], array[3..4]
  end

  def test_further_out_of_range_slices_returns_nil
    array = [:first, :second, :third]
    assert_equal nil, array[4, 1]
    assert_equal nil, array[4..5]
    assert_equal nil, array[15, 1]
    assert_equal nil, array[15..20]
  end

end

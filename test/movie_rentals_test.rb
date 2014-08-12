require 'minitest/autorun'
require '../lib/rentals'
require '../lib/movie'
require '../lib/regular_movie'
require '../lib/childrens_movie'
require '../lib/new_release_movie'

class MovieRentalsTest < MiniTest::Test
  def setup
    @regular = RegularMovie.new('Regular')
    @childrens = ChildrensMovie.new('Childrens')
    @new_release = NewReleaseMovie.new('New Release')
  end

  def test_rent_regular_movie_for_one_day
    r = Rentals.new('Customer', 1)
    r.add_movie(@regular)
    assert_equal(2, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_regular_movie_for_two_days
    r = Rentals.new('Customer', 2)
    r.add_movie(@regular)
    assert_equal(2, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_regular_movie_for_three_days
    r = Rentals.new('Customer', 3)
    r.add_movie(@regular)
    assert_equal(3.5, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_regular_movie_for_four_days
    r = Rentals.new('Customer', 4)
    r.add_movie(@regular)
    assert_equal(5.0, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_children_movie_for_one_day
    r = Rentals.new('Customer', 1)
    r.add_movie(@childrens)
    assert_equal(1.5, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_children_movie_for_three_days
    r = Rentals.new('Customer', 3)
    r.add_movie(@childrens)
    assert_equal(1.5, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_children_movie_for_four_days
    r = Rentals.new('Customer', 4)
    r.add_movie(@childrens)
    assert_equal(3.0, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_children_movie_for_five_days
    r = Rentals.new('Customer', 5)
    r.add_movie(@childrens)
    assert_equal(4.5, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_new_release_for_one_day
    r = Rentals.new('Customer', 1)
    r.add_movie(@new_release)
    assert_equal(3.0, r.total_dues)
    assert_equal(1, r.total_points)
  end

  def test_rent_new_release_for_two_days
    r = Rentals.new('Customer', 2)
    r.add_movie(@new_release)
    assert_equal(6.0, r.total_dues)
    assert_equal(2, r.total_points)
  end

  def test_rent_multiple
    r = Rentals.new('Customer', 5)
    r.add_movie(@regular)
    r.add_movie(@childrens)
    r.add_movie(@new_release)
    assert_equal(26, r.total_dues)
    assert_equal(4, r.total_points)
  end

  def test_statement_multiple
    r = Rentals.new('Customer', 5)
    r.add_movie(@regular)
    r.add_movie(@childrens)
    r.add_movie(@new_release)
    assert_equal("5 day(s) Rental Statement for Customer:\n" +
                     "\tMovie\tDues\tPoints\n" +
                     "\tRegular\t6.50\t1\n" +
                     "\tChildrens\t4.50\t1\n" +
                     "\tNew Release\t15.00\t2\n" +
                     "Total Dues: 26.00\n" +
                     "Total Points: 4", r.print_statement)
  end
end
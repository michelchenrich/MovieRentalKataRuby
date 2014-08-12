class Rentals
  Item = Struct.new(:title, :dues, :points)

  def initialize(customer, days)
    @customer = customer
    @days = days
    @total_points = 0
    @total_dues = 0
    @items = []
  end

  def add_movie(movie)
    @items << item = Item.new(movie.title, movie.calculate_dues(@days), movie.calculate_points(@days))
    @total_dues += item.dues
    @total_points += item.points
  end

  def total_dues
    @total_dues
  end

  def total_points
    @total_points
  end

  def print_statement
    print = "%d day(s) Rental Statement for %s:\n" % [@days, @customer]
    print += "\tMovie\tDues\tPoints\n"
    @items.each { |item| print += "\t%s\t%.2f\t%d\n" % [item.title, item.dues, item.points] }
    print += "Total Dues: %.2f\n" % @total_dues
    print + "Total Points: %d" % @total_points
  end
end
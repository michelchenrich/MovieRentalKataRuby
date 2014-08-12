class NewReleaseMovie < Movie
  def initialize(title)
    super(title)
  end

  def calculate_dues(days)
    3 * days
  end

  def calculate_points(days)
    points = super(days)
    points += 1 if days > 1
    points
  end
end
class RegularMovie < Movie
  def initialize(title)
    super(title)
  end

  def calculate_dues(days)
    dues = 2
    dues += 1.5 * (days - 2) if days > 2
    dues
  end
end
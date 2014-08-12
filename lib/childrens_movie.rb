class ChildrensMovie < Movie
  def initialize(title)
    super(title)
  end

  def calculate_dues(days)
    dues = 1.5
    dues += 1.5 * (days - 3) if days > 3
    dues
  end
end
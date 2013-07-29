class Area

  attr_accessor :zipcode, :estimated_population, :city, :state

  def initialize( hash )

      @zipcode = hash[:zipcode] || 0
      @estimated_population = hash[:estimated_population] || 0
      @city = hash[:city] || "n/a"
      @state = hash[:state] || "n/a"

  end

  def to_s

    "#{city}, #{state} #{zipcode} has #{estimated_population} people."

  end

end

=begin
# Code to test results based on area_spec.rb....
h = {
        zipcode: "94102",
        city: "SAN FRANCISCO", 
        state: "CA", 
        estimated_population: "16733" 
      }
  a = Area.new(h)
  puts a.to_s
  =end 
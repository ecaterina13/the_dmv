class VehicleFactory
   def initialize
   end


  def create_vehicles(registrations)
    registrations.map do |registration|
      Vehicle.new({vin: registration[:vin_1_10], make: registration[:make], 
      model: registration[:model], year: registration[:model_year].to_i, engine: :ev}) 
    end
  end
  
  def count_vehicles_by_year(registrations, year)
    registrations.count do |registration|
      registration[:model_year].to_i == year
    end
  end
end
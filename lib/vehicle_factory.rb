class VehicleFactory
   def initialize
   end


  def create_vehicles(registrations)
    registrations.map do |registration|
      vehicle = Vehicle.new({vin: registration[:vin_1_10], make: registration[:make], 
      model: registration[:model], year: registration[:year], engine: :ev})
      binding.pry
    end
  end
end
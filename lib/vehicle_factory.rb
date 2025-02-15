class VehicleFactory
   def initialize
   end


  def create_vehicles(registrations)
    registrations.map do |registration|
      vehicle = Vehicle.new(vin: registration[:vin], make: registration[:make], model: registration[:model], year: registration[:year], engine: registration[:engine])
    end
  end
end
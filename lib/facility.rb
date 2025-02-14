class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees
  

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    set_plate_type(vehicle)
    @registered_vehicles << vehicle  
    
  end
  
  def set_plate_type(vehicle)
    if vehicle.electric_vehicle? 
      vehicle.plate_type = :ev
    elsif vehicle.antique?
      vehicle.plate_type = :antique
    else 
      vehicle.plate_type = :regular
    end
  end




  # def count_collected_fees
  #   @collected_fees += fees
  #   end

  #   def plate_type
  #     @plate_type = :regular
  #   end
  # end
end


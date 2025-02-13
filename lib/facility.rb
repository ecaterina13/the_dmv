class Facility
  attr_reader :name, :address, :phone, :services, :registred_vehicles, :collected_fees

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registred_vehicles = []
    @collected_fees = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registred_vehicles << vehicle  
  end

  def count_collected_fees
    
  end
end

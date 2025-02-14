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
    add_vehicle_fees(vehicle)
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

  def add_vehicle_fees(vehicle)
    if vehicle.plate_type == :ev
      @collected_fees += 200
    elsif vehicle.plate_type == :antique
      @collected_fees += 25
    else 
      @collected_fees += 100
     end
  end
 
  def administer_written_test(registrant)
    if registrant.age >= 16 && registrant.permit?
      registrant.license_data[:written] = true
    else
      registrant.license_data[:written] = false
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      registrant.license_data[:license] = false
    end
  end

  def can_renew_license(registrant)
    if registrant.license_data[:written] && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    else
      registrant.license_data[:renewed] = false
    end
  end
end


require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'pry'
RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it "can initialize a VehicleFactory" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it "returns an Array" do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)

      expect(vehicles).to be_an_instance_of(Array)
    end

    it "returns an Array of vehicles" do
      vehicle = @factory.create_vehicles(@wa_ev_registrations).first

      expect(vehicle).to be_an_instance_of(Vehicle)
    end

    xit "sets the appropriate values for a vehicle" do
      vehicle = @factory.create_vehicles(@wa_ev_registrations).first

      expect(vehicle.vin).to eq("1N4BZ0CP3G")
      expect(vehicle.year).to eq(2016)
      expect(vehicle.registration_date).to eq(Date.new(2024,2,27))
    end
  end
end
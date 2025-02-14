require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require 'date'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
      expect(@facility.registered_vehicles). to eq([])
      expect(@facility.collected_fees). to eq(0)
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle'do
    it "sets the registration date" do
      @facility.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end
    it 'adds the vehicle to the registered vehicles arrray' do 
      @facility.register_vehicle(@cruz)

      expect(@facility.registered_vehicles).to eq([@cruz])
    end

    it 'sets the plate type to regular when vehicle is regular type' do
      @facility.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq(:regular)
    end
    it 'sets the plate type to ev when vehicle is ev type' do
      @facility.register_vehicle(@bolt)

      expect(@bolt.plate_type).to eq(:ev)
    end
    it 'sets the plate type to antique when vehicle is antique type' do
      @facility.register_vehicle(@camaro)
      
      expect(@camaro.plate_type).to eq(:antique)
    end

    it 'correctly adds all the vehicle fees' do 
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      @facility.register_vehicle(@camaro)

      expect(@facility.collected_fees).to eq(325)
    end
  end
    

  # expect(@facility_2).to be_an_instance_of(Facility)
  # expect(@facility_2.services).to eq([])
  # register vehicle bolt
  # expect(@facility_2.registered_vehicles). to eq([])
  # expect(@facility_2.collected_fees). to eq(0)


end
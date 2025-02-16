require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'
require 'date'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles). to eq([])
      expect(@facility_1.collected_fees). to eq(0)
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.services).to eq([])
      # register vehicle bolt
      expect(@facility_2.registered_vehicles). to eq([])
      expect(@facility_2.collected_fees). to eq(0)
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service("Renew License")
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration', 'Written Test', "Road Test", "Renew License"])
    end
  end

  describe '#register_vehicle'do
    it "sets the registration date" do
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end
    it 'adds the vehicle to the registered vehicles arrray' do 
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'sets the plate type to regular when vehicle is regular type' do
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq(:regular)
    end
    it 'sets the plate type to ev when vehicle is ev type' do
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.plate_type).to eq(:ev)
    end
    it 'sets the plate type to antique when vehicle is antique type' do
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.plate_type).to eq(:antique)
    end

    it 'adds all the vehicle fees' do 
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)

     expect(@facility_1.collected_fees).to eq(325)
    end
  end
  
  describe '#administer_written_test' do
    it 'administers written test to registrant_1' do
      @facility_1.administer_written_test(@registrant_1)
      
      expect(@registrant_1.license_data[:written]). to eq(true)
    end
    it 'administers written test to registrant_2' do
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      
      expect(@registrant_2.license_data[:written]). to eq(true)
    end  
    it 'administers written test to registrant_3' do
      @facility_1.administer_written_test(@registrant_3)
      
      expect(@registrant_1.license_data[:written]). to eq(false)
    end
 end

  describe '#administer_road_test ' do
    it 'administers road test to registrant_1' do 
      @facility_1.administer_written_test(@registrant_1)

      @facility_1.administer_road_test(@registrant_1)

      expect(@registrant_1.license_data[:license]). to eq(true)
    end

    it 'administers road test to registrant_2' do
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)

      @facility_1.administer_road_test(@registrant_2)

      expect(@registrant_2.license_data[:license]).to eq(true)
    end
  end

  describe '#renew_license' do
    it 'can renew a license for a registrant' do
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      @facility_1.renew_license(@registrant_1)

      expect(@registrant_1.license_data[:renewed]).to eq(true)
    end
  end
end 






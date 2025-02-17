require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility'
require './lib/facility_factory'
require 'pry'

RSpec.describe VehicleFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
#binding.pry
  end
  describe '#initialize' do
    it "can initialize a FacilityFactory" do
      expect(@facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_locations' do
    it "creates a CO location" do
      facilities = @facility_factory.create_facilities(@co_dmv_office_locations, "colorado")

      expect(facilities).to be_an_instance_of(Array) 

      expect(facilities.first).to be_an_instance_of(Facility)
      expect(facilities.first.name).to eq("DMV Tremont Branch")
      expect(facilities.first.address).to eq("2855 Tremont Place")
      expect(facilities.first.phone). to eq("(720) 865-4600")
      expect(facilities.first.services).to eq(["vehicle titles", "registration", "renewals;  VIN inspections"])
  
    end

    it "creates a NY location" do
      facilities = @facility_factory.create_facilities(@ny_dmv_office_locations, "new_york")

      expect(facilities).to be_an_instance_of(Array) 

      expect(facilities.first).to be_an_instance_of(Facility)
      expect(facilities.first.name).to eq("LAKE PLACID")
      expect(facilities.first.address).to eq("2693 MAIN STREET")
      expect(facilities.first.phone). to eq(nil)
      expect(facilities.first.services).to eq([])
   end
   it "creates a MO location" do
    facilities = @facility_factory.create_facilities(@mo_dmv_office_locations, "missouri")

    expect(facilities).to be_an_instance_of(Array) 

    expect(facilities.first).to be_an_instance_of(Facility)
    expect(facilities.first.name).to eq("Clayton")
    expect(facilities.first.address).to eq("147 N Meramec Ave")
    expect(facilities.first.phone). to eq("(314) 499-7223")
    expect(facilities.first.services).to eq([])
  end
  end
end
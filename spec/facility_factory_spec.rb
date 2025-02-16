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
#binding.pry
  end
  describe '#initialize' do
    it "can initialize a FacilityFactory" do
      expect(@facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end
end
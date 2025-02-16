class FacilityFactory
  def initialize

  end


  def create_facilities(locations)
     locations.map do |location|
     binding.pry
     facility = Facility.new({name: location[dmv_office], address: location[address_li], phone: location[phone], services: location[serices_p] })
    end
  end
end
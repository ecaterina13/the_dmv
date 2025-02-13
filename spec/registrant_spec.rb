
require './lib/registrant'
RSpec.describe Registrant do
  it "exists" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1).to be_instance_of(Registrant)
    expect(registrant_2).to be_instance_of(Registrant)   
  end
  it "has a name" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.name). to eq("Bruce")
    expect(registrant_2.name). to eq("Penny")
    
  end





end

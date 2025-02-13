class Registrant
    attr_reader :name, :age, :permit, :licence_data
    def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = licence_data
    end
end
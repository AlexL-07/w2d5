class Passenger

    attr_reader :name
    
    def initialize(name)
        @name = name
        @flight_numbers = []
    end


    def has_flight?(num)
        if @flight_numbers.include?(num.upcase)
            return true
        else 
            return false
        end
    end

    def add_flight(num)
        @flight_numbers << num.upcase if !self.has_flight?(num)
    end
end

    
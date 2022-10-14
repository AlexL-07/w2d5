class Item
    
    attr_reader :title, :deadline, :description, :done

    def self.valid_date?(date_string)
        dates = date_string.split("-")
        
        if dates.length != 3
            return false
        end

        if !(1..12).include?(dates[1].to_i)
            return false
        end

        if !(1..31).include?(dates[2].to_i)
            return false
        end
        
        true
    end

    def initialize(title, deadline, description)
        raise "this is an invalid date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        raise "this is an invalid date" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def description=(new_description)
        @description = new_description
    end

    def toggle
        if @done == false
            @done = true
        else
            @done = false
        end
    end
end



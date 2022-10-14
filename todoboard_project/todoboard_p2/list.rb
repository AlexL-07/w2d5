require_relative './item.rb'
class List
    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = '')
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx >= 0 && idx < @items.length
    end
    
    def swap(idx_1, idx_2)
        if self.valid_index?(idx_1) && self.valid_index?(idx_2)
            @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
            return true
        else
            return false
        end
    end

    def [](idx)
        if self.valid_index?(idx)
            return @items[idx]
        else 
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts self.label.upcase
        puts "____________________________________"
        puts "Index | Item | Deadline | Done?"
        @items.each_with_index do |item, i|
            puts "#{i.to_s} | #{item.title} | #{item.deadline} | #{item.done}  "
        end 
    end

    def print_full_item(index)
        item = @items[index]
        puts "#{item.title}"
        puts "#{item.deadline}"
        puts "#{item.description}"
        puts "#{item.done}"
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(idx, amount=1)
        return false if !valid_index?(idx)
        while amount > 0 && idx != 0
            self.swap(idx, idx - 1)
            idx -= 1
            amount -= 1
        end
        true
    end 

    def down(idx, amount=1)
        return false if !valid_index?(idx)
        while amount > 0 && idx != size - 1
            self.swap(idx, idx + 1)
            idx += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(idx)
        return false if !valid_index?(idx)
        @items.delete_at(idx)
        true
    end

    def purge
        @items.each_with_index do |item, i|
            if item.done == true
                self.remove_item(i)
            end
        end
    end
end
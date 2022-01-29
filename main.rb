class Node

    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end

end

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def append(item)
        if @head.nil?
            @head = Node.new(item, nil)
        else
            l_node = @head
            while !l_node.next_node.nil?
                l_node = l_node.next_node
            end
            l_node.next_node = Node.new(item, nil)
        end
    end

    def tail
        til = @head
        until til.next_node.nil?
            til = til.next_node
        end
        til
    end

    def prepend(item)
        if @head.nil?
            @head = item
            @tail = item
        else
            h_node = @head
            @head = Node.new(item, h_node)
        end
    end

    def size
        counter = 0
        cnode = @head
        until cnode.nil?
            cnode = cnode.next_node
            counter += 1
        end
        counter
    end

    def at(indx)
        return if @head.nil?
        a = 1
        h_node = @head
        while a != indx
            h_node = h_node.next_node
            a += 1
        end
        h_node
    end

    def pop
        return if @head.nil?
        a = tail
        h_node = @head
        while h_node.next_node.value != a
            h_node = h_node.next_node
        end
        h_node.next_node = nil
    end

    def contains?(item)
        h_node = @head
        until h_node.value == item || h_node.next_node.nil?
            h_node = h_node.next_node
        end
        if h_node.value == item
            true
        else
            false
        end
    end

    def find(item)
        a = 1
        h_node = @head
        until h_node.value == item || h_node.next_node.nil?
            a += 1
            h_node = h_node.next_node
        end
        if h_node.value == item
            return a
        else
            return "Doesn't Exist"
        end
    end

    def to_s
        h_node = @head
        val = ""
        until h_node.nil?
            val << "( #{h_node.value} ) -> "
            h_node = h_node.next_node
            val << " nil" if h_node.nil?
        end
        val
    end

    def insert_at(value, index)
        if index > self.size
            return puts "OUT OF RANGE ERROR INDEX GREATER THAN RANGE"
        elsif (index) == self.size
            self.append(value)
        elsif index == 0
            self.prepend(value)
        else
            new_node = Node.new(value, at(index))
            prev_node = at(index-1)
            prev_node.next_node = new_node
        end
    end

end

ll = LinkedList.new
ll.append(12)
ll.append(22)
ll.append(88)
ll.append(5)

puts ll.insert_at(15, 2)
puts ll.to_s

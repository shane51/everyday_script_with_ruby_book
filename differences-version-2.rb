#---
# Excerpted from "Everyday Scripting in Ruby"
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/bmsft for more book information.
#---

unless ARGV.length == 2
	puts "Usage: different.rb old-inventory new-inventory"
	exit
end

def inventory_from(filename)
	File.open(filename).collect do | line |
		line.downcase
	end
end

old_inventory = inventory_from(ARGV[0])

new_inventory = inventory_from(ARGV[1])

add_num = (new_inventory - old_inventory).length
puts "The following #{add_num} files have been added:"
puts new_inventory - old_inventory

del_num = (old_inventory - new_inventory).length
puts "The following #{del_num} files have been deleted:"
puts old_inventory - new_inventory
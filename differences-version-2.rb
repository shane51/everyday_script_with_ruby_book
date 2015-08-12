#---
# Excerpted from "Everyday Scripting in Ruby"
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/bmsft for more book information.
#---
def check_usage
	unless ARGV.length == 2
		puts "Usage: different.rb old-inventory new-inventory"
		exit
	end
end


def boring?(line)
	#puts "boring?" + line.inspect
	line.chomp.split('/').include?('temp') or 
	line.chomp.split('/').include?('recycler')
end

def inventory_from(filename)
	inverntory = File.open(filename)
	downcased = inverntory.collect do |line|
		line.chomp.downcase
	end
	downcased.reject do |line|
		boring?(line)
	end
end


def compare_inventory_files(old_file, new_file)
	old_inventory = inventory_from(old_file)

	new_inventory = inventory_from(new_file)

	add_num = (new_inventory - old_inventory).length
	puts "The following #{add_num} files have been added:"
	puts new_inventory - old_inventory

	del_num = (old_inventory - new_inventory).length
	puts "The following #{del_num} files have been deleted:"
	puts old_inventory - new_inventory
end

if $0 == __FILE__
	check_usage
	compare_inventory_files(ARGV[0],ARGV[1])
end
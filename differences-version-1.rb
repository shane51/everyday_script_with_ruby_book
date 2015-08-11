#---
# Excerpted from "Everyday Scripting in Ruby"
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/bmsft for more book information.
#---
old_inventory = File.open('old-inventory.txt').readlines
new_inventory = File.open('new-inventory.txt').readlines

add_num = (new_inventory - old_inventory).length
puts "The following #{add_num} files have been added:"
puts new_inventory - old_inventory

del_num = (old_inventory - new_inventory).length
puts "The following #{del_num} files have been deleted:"
puts old_inventory - new_inventory

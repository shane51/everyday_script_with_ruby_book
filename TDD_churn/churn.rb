#---
# Excerpted from "Everyday Scripting in Ruby"
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/bmsft for more book information.
#---


def month_before(a_time)
  a_time - 28*24*60*60
end

def header(a_time)
  a_time.strftime("Changes since %Y-%m-%d:")
end

def subsystem_line(subsystem_name, change_count)
	asterisks = asterisks_for(change_count)
	"#{subsystem_name.rjust(14)} #{asterisks} (#{change_count})"
end

def asterisks_for(change_count)
	'*' * ( change_count / 5.0 ).round
end

def change_count_for(name)
  extract_change_count_from(svn_log(name))
end
def extract_change_count_from(log_txt)
  lines = log_txt.split("\n")
  dashed_lines = lines.find_all do  | line |
    line.include?('----')
  end
  dashed_lines.length - 1
end

if $0 == __FILE__    #(1)
  subsystem_names = ['audit', 'fulfillment', 'persistence',    #(2)
                     'ui', 'util', 'inventory']
  start_date = month_before(Time.now)       #(3)

  puts header(start_date)                   #(4)
  subsystem_names.each do | name |
    puts subsystem_line(name, change_count_for(name)) #(5)  
  end
end
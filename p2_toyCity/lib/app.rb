require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
require 'date'
puts Time.new().to_date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

brands = Hash.new

# For each product in the data set:
products_hash['items'].each do |item|
    # Print the name of the toy
    puts "Name: " + item['title']
    
    # Print the retail price of the toy
    puts "Retail: $" + item['full-price']
    
    # Calculate and print the total number of purchases
    puts "# of Purchases: " + item['purchases'].size.round.to_s
    
    # Calculate and print the average price the toy sold for
    revenue = 0.0
    item['purchases'].each do |p|
	revenue += p['price']
    end
    avg_price = revenue / item['purchases'].size
    puts "Average Sale Price: $" + avg_price.round(2).to_s
    
    # Calculate and print the average discount (% or $) based off the average sales price
    puts "Average Discount: " + ((Float(item['full-price']) - avg_price) * 100 / Float(item['full-price'])).round(1).to_s + "%"
    
    # Do Brand stuff
    unless brands.has_key?(item['brand'])
	brands[item['brand']] = Hash.new

	# Count and print the number of the brand's toys we stock
	brands[item['brand']]['Number of toys'] = 1

	# Calculate the average total retail of all the brand's toys
	brands[item['brand']]['Retail Total'] = Float(item['full-price'])

	# Calculate the total revenue of all the brand's toy sales combined
	brands[item['brand']]['Revenue'] = revenue
    else
	brands[item['brand']]['Number of toys'] += 1
	brands[item['brand']]['Retail Total'] += Float(item['full-price'])
	brands[item['brand']]['Revenue'] += revenue
    end

    puts ""

end # end product_has.each

puts " _                         _     "
puts "| |                       | |    "
puts "| |__  _ __ __ _ _ __   __| |___ "
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts "| |_) | | | (_| | | | | (_| \\__ \\"
puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
puts ""

# For each brand in the data set:
brands.each do |key, value|
    # Print the name of the brand
    puts "Name: " + key

    # Print the number of the brand's toys we stock
    puts "Toys we stock: " + value['Number of toys'].to_s

    # Calculate and print the average price of the brand's toys
    puts "Average Price: $" + (value['Retail Total'] / value['Number of toys']).round(2).to_s

    # Calculate and print the total revenue of all the brand's toy sales combined
    # Prints are on two lines because I kept getting a MethodError saying Float doesn't have to_s
    print "Total Revenue: $"
    puts value['Revenue'].round(2)

    puts ""

end # end brands.each


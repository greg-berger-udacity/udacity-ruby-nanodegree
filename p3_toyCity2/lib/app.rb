# app.rb - ToyCity 2: Refactored version of ToyCity 1

require 'json'

# Global Variables
#   $products: hash of products from json
#   $report_file: output file
#   $brands: brand info in a hash

# methods go here
def output(s)
  $report_file.puts(s)
end

def setup_files
  path = File.join(File.dirname(__FILE__), '../data/products.json')
  file = File.read(path)
  $products = JSON.parse(file)
  $report_file = File.new("report.txt", "w+")
end

def create_report
  print_sales_report_header

  print_products_header
  $products['items'].each do |p|
    result = calculate_product(p)
    print_product(result)
  end
  
  print_brands_header
  parse_brand_info
  $brands.each do |key, value|
    print_brand(key, value)
  end
end

def calculate_product(p)
  result = Hash.new

  result['Name'] = p['title']
  result['Retail'] = p['full-price']
  result['Total Sales'] = p["purchases"].inject(0) { |total, purchase| total + purchase['price']}
  p['revenue'] = result['Total Sales'] # used in parse_brand_info
  result['Total Purchases'] = p['purchases'].size
  result['Average Sale'] = result['Total Sales'] / result['Total Purchases']
  result['Average Discount'] = ( (Float(p['full-price']) - result['Average Sale']) * 100 / Float(p['full-price']) ).round(1)
  
  return result
end

def print_product(p)
  output("Name: " + p['Name'])
  output("Retail: " + p['Retail'])
  output("Total Sales: $" + p['Total Sales'].to_s)
  output("Total Purchases: " + p['Total Purchases'].to_s)
  output("Average Sale: $" + p['Average Sale'].to_s)
  output("Average Discount: " + p['Average Discount'].to_s + "%")
  output("") # formatting
end

# Fill in all info in global $brands variable
def parse_brand_info()
  $brands = Hash.new
  $products['items'].each do |item|
    unless $brands.has_key?(item['brand'])
      $brands[item['brand']] = Hash.new

      # Count and print the number of the brand's toys we stock
      $brands[item['brand']]['Number of toys in stock'] = item['stock']
      $brands[item['brand']]['Number of Unique Toys'] = 1

      # Calculate the average total retail of all the brand's toys
      $brands[item['brand']]['Retail Total'] = Float(item['full-price'])

      # Calculate the total revenue of all the brand's toy sales combined
      $brands[item['brand']]['Revenue'] = item['revenue']
    else
      $brands[item['brand']]['Number of toys in stock'] += item['stock']
      $brands[item['brand']]['Number of Unique Toys'] += 1
      $brands[item['brand']]['Retail Total'] += Float(item['full-price'])
      $brands[item['brand']]['Revenue'] += item['revenue'].round(2)
    end
    # Calculate Average Price
    $brands[item['brand']]['Average Price'] = ($brands[item['brand']]['Retail Total'] / $brands[item['brand']]['Number of Unique Toys']).round(2)
  end # end each product
end # end parse_brand_info

# Print all info for brand
def print_brand(key, value)
  # Print the name of the brand
  output("Name: " + key)

  # Print the number of the brand's toys we stock
  output("Toys we stock: " + value['Number of toys in stock'].to_s)

  # Calculate and print the average price of the brand's toys
  output("Average Price: $" + value['Average Price'].to_s)

  # Calculate and print the total revenue of all the brand's toy sales combined
  # Prints are on two lines because I kept getting a MethodError saying Float doesn't have to_s
  output("Total Revenue: $" + value['Revenue'].round(2).to_s)

  output("")

end # end do_brand

# ASCII art courtesy of Udacity reviewer
def print_sales_report_header
  output "  #####                                 ######"
  output " #     #   ##   #      ######  ####     #     # ###### #####   ####  #####  #####"
  output " #        #  #  #      #      #         #     # #      #    # #    # #    #   #"
  output "  #####  #    # #      #####   ####     ######  #####  #    # #    # #    #   #"
  output "       # ###### #      #           #    #   #   #      #####  #    # #####    #"
  output " #     # #    # #      #      #    #    #    #  #      #      #    # #   #    #"
  output "  #####  #    # ###### ######  ####     #     # ###### #       ####  #    #   #"
  output "********************************************************************************"
end

def print_products_header
  output "                     _            _       "
  output "                    | |          | |      "
  output " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
  output "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
  output "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
  output "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
  output "| |                                       "
  output "|_|                                       "
end

def print_brands_header
  output " _                         _     "
  output "| |                       | |    "
  output "| |__  _ __ __ _ _ __   __| |___ "
  output "| '_ \\| '__/ _` | '_ \\ / _` / __|"
  output "| |_) | | | (_| | | | | (_| \\__ \\"
  output "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
  output ""
end

# start report generation
def start
  setup_files
  create_report
end

# run app
start


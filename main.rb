require_relative 'models/product'
require_relative 'models/receipt'

require_relative 'services/csv_reader'
require_relative 'services/receipt_builder'
require_relative 'services/receipt_printer'
require_relative 'services/receipt_writer'

require 'optparse'
require 'byebug'

# Usage:
if __FILE__ == $0  # This block will execute only if the script is run directly from the command line
  options = { output_file: nil }
  OptionParser.new do |opts|
    opts.banner = 'Usage: ruby main.rb INPUT_FILE [options]'

    opts.on('-o', '--output OUTPUT_FILE', 'Specify the output file') do |output_file|
      options[:output_file] = output_file
    end

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  # Fetch the input file (mandatory argument)
  input_file = ARGV[0]

  unless input_file
    puts 'Error: Please provide the input file.'
    puts 'Usage: ruby main.rb INPUT_FILE [options]'
    exit 1
  end

  receipt = ReceiptBuilder.build(input_file)

  if options[:output_file]
    ReceiptWriter.write(receipt, options[:output_file])
    puts "Output is written to file: #{options[:output_file]}"
  else
    ReceiptPrinter.print(receipt)
  end
end

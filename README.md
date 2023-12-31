# README

# Receipt Printer

## Overview

The Receipt Printer is a command line Ruby application that processes input data from CSV files, provides options for displaying standard out or CSV. It includes services for reading CSV files, building receipts, printing receipt details, and writing receipt details to output csv files.

## Usage

### Prerequisites

- Ruby (version ruby 3.1.1)
- Bundler

### Installation

1. Clone the repository:

    ```bash
    git clone git@github.com:jin521/receipt_printer.git
    ```

2. Install dependencies:

    ```bash
    cd receipt_printer
    bundle install
    ```

### Running the Application

```bash

standard out:
ruby main.rb sample_inputs/sample1.csv
ruby main.rb sample_inputs/sample2.csv
ruby main.rb sample_inputs/sample3.csv

or output to csv:
# NOTE: it would be a malformed csv if follow the requirements, so only show the products on the csv
ruby main.rb sample_inputs/sample1.csv --output output1.csv
ruby main.rb sample_inputs/sample2.csv --output output2.csv
ruby main.rb sample_inputs/sample3.csv --output output3.csv
```

## Contributing

Contributions to this project are welcome. If you find any issues or would like to suggest improvements, please open an issue or submit a pull request. Make sure to follow the project's code of conduct.

## License

This project is licensed under the [MIT License](LICENSE).
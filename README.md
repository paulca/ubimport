# UBImporter #

An import utility for Ulster Bank Ireland Bankline CSV files that outputs a CSV file compatible with Xero.com

## Install ##

gem install ubimport

## Usage ##

    ubimport path-to-csv-file.csv

if you want to create a new file

    ubimport path-to-csv-file.csv > new-file.csv

## API ##

    require 'ubimporter'
    
    infile = '/path/to/csv_file.csv'
    outfile = '/path/to/csv_file_fixed.csv'
    
    importer = UBImporter.new(file)
    importer.write(outfile)
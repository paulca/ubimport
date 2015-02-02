require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'smarter_csv'

class UBImporter
  
  attr_accessor :original_file, :original_lines, :changed_lines
  
  def initialize(original_file)
    @original_file = original_file
  end

  def changed_lines
    @changed_lines ||= SmarterCSV.process(original_file,convert_values_to_numeric: false).collect do |row|
      # *Date,*Amount,Description,Reference
      [
        row[:date],
        row[:credit] || row[:debit],
        [row[:"narrative_#1"], row[:"narrative_#2"], row[:"narrative_#3"], row[:"narrative_#4"], row[:"narrative_#5"]].compact.join(' '),
        row[:"narrative_#2"]
      ]
    end
  end
  
  def output
    headers = ['Date', 'Amount', 'Description','Reference'].to_csv
    lines = changed_lines.collect(&:to_csv).join
    headers + lines
  end
end
require 'fastercsv'
class UBImporter
  
  attr_accessor :original_file, :original_lines, :changed_lines
  
  def initialize(original_file)
    @original_file = original_file
    @original_lines = []
    @changed_lines = []
    FasterCSV.foreach(original_file) do |row|
      @original_lines << row
    end
    @original_lines.each do |line|
      @changed_lines << process_line(line)
    end
  end
  
  def output
    changed_lines.collect { |line| line.to_csv }.join
  end
  
  def process_line(line)
    if line.first == 'Sort Code'
      line[17] = 'Amount'
      line[16] = 'TxType'
    elsif line.last.to_i > 0
      line[16] = 'CREDIT'
    elsif line[16].to_i < 0
      line[17] = line[16]
      line[16] = 'DEBIT'
    end
    line
  end
  
end
require 'spec_helper'

describe UBImporter do
  
  let(:importer) { UBImporter.new('spec/fixtures/sample.csv') }
  
  describe "#original_lines" do
    it "should load the file" do
      importer.should have(3).original_lines
      importer.should have(3).changed_lines
    end
    
    it "should change the last few parts of the first line" do
      importer.changed_lines.first.length.should == 18
      importer.changed_lines.first[17].should == 'Amount'
      importer.changed_lines.first[16].should == 'TxType'
    end
    
    it "should change the last few parts of the second line" do
      importer.changed_lines[1].length.should == 18
      importer.changed_lines[1][17].should == '-900.00'
      importer.changed_lines[1][16].should == 'DEBIT'
    end

    it "should change the last few parts of the third line" do
      importer.changed_lines[2].length.should == 18
      importer.changed_lines[2][17].should == '3811.50'
      importer.changed_lines[2][16].should == 'CREDIT'
    end
  end
  
  describe "#output" do
    it "should output the file correctly" do
      importer.output.should == File.read('spec/fixtures/sample_output.csv')
    end
  end
  
end
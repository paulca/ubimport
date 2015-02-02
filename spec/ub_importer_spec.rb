require 'spec_helper'

describe UBImporter do
  
  let(:importer) { UBImporter.new('spec/fixtures/sample.csv') }
  
  describe "#original_lines" do
    it "should load the file" do
      expect(importer.changed_lines.length).to eq(2)
    end
    
    it "should change the last few parts of the first line" do
      expect(importer.changed_lines.first.length).to eq(4)
      expect(importer.changed_lines.first[0]).to eq('29/11/2010')
      expect(importer.changed_lines.first[1]).to eq('-900.00')
    end

    it "should change the last few parts of the second line" do
      expect(importer.changed_lines[1].length).to eq(4)
      expect(importer.changed_lines[1][0]).to eq('26/11/2010')
      expect(importer.changed_lines[1][1]).to eq('3811.50')
    end
  end
  
  describe "#output" do
    it "should output the file correctly" do
      expect(importer.output).to eq(File.read('spec/fixtures/sample_output.csv'))
    end
  end
  
end
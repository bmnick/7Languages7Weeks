class ActsAsCsv
  def read
    file = File.new(self.class.to_s.downcase + '.csv')
    @headers = file.gets.chomp.split(', ')
    
    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end
  
  def headers
    @headers
  end
  
  def csv_contents
    @result
  end
  
  def each
    @result.each do |row|
      yield CsvRow.new( @headers.collect{|h| h.intern}, row )
    end
  end
  
  def initialize
    @result = []
    read
  end
end

class CsvRow
  def initialize headers, values
    @headers = headers
    @values = values
  end
  
  def method_missing name, *args
    if @headers.include? name
      @values[@headers.index(name)]
    end
  end
  
end

class RubyCsv < ActsAsCsv
end

csv = RubyCsv.new
csv.each {|row| puts row.act1}
class CSVReader 

  attr_accessor :fileName, :headers

  def initialize(fileName)
    @fileName = fileName
  end

  def headers=( headers )

    @headers = headers.split( ',' )

    @headers.map! do |ele|

        ele.cleanse
        ele.underscore

    end

  end 

  def create_hash( arg )

    newHash = {}

    @headers.each_with_index do |headerText, index|

      arg[index].cleanse
      newHash[headerText] = arg[index]

    end

    newHash

  end

end

class String

  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  def cleanse 

    self.gsub!( '"', '' )
    self.strip!

  end

end

# Test data
foo = CSVReader.new( "foo" )
foo.headers = '"RecordNumber","Zipcode","ZipCodeType"' 
puts foo.headers
puts foo.create_hash( foo.headers )
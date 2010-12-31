class Wish < Struct.new(:medium, :relationship, :relationship_years, :sent_at, :multiple_medium)

  @@wishes = []

  def self.import(filename)
    file_path = File.join(File.dirname(__FILE__), "/wishes.txt")
    File.open(file_path, "r") do |file|
      file.each_line do |line|
        unless line[/(^\n|^\#)/] # Skip blank or comment lines
          attrs = line.split(", ").collect{ |l| l.strip.gsub(/(^\"|\"$)/,"") }
          @@wishes << Wish.new(attrs[0], attrs[1], attrs[2], attrs[3], attrs[4])
        end
      end
    end
    
    @@wishes
  end

end
require 'nokogiri'
require 'open-uri'
require 'mechanize'

def titleize(str)
  str.split(/(\W)/).map(&:capitalize).join
end

def parse_restaurant_page(url)
  # e.g. http://web3.clackamas.us/healthapp/rim.jsp?q_ID=0310262A&q_iID=59512621
  agent = Mechanize.new
  
  page = agent.get(url)
  rblock = page.search("//div[@id='content']/p[1]").to_s.split("<br>")
  name = Nokogiri::HTML(rblock[0]).text
  street = rblock[1].gsub(/\s/, ' ').strip.squeeze(' ')
  csz = rblock[2].gsub(/\s/, ' ' ).strip
  county = "Clackamas"
  state = "OR"

  if m = csz.match(/([A-Z ]*), (OR) (97\d{3})/)
    city = titleize(m[1]).strip
    zip = m[3]
    puts "name: #{name}"
    puts "street: #{street}"
    puts "city: #{city}"
    puts "state: #{state}"
    puts "zip: #{zip}"
  else
    puts "street: #{street}"
    puts "city: #{city}"
    puts "state: #{state}"
    puts "zip: #{zip}"
  end

  # get the inspection on this page and then all the others listed
  this_inspection_name = page.search("#content > p:nth-child(5)")
  inspection_table = page.search("//table")
end


def get_inspection(page)
  
end


def run_parser(url)
  
  inspection_links = report.links.select { |l| l.href =~ /rim\.jsp\?q_ID=\d+/ }
  inspection_links.each do |i|
    idate = i.text
    inspection = i.click
    # puts "visiting #{i.href}"
    bottom_table = inspection.search("//table[@border='0']/tr[2]/td/table")
    # this is the comments and violations part
    bottom_table.each do |cell|
      kids = cell.children.search("td")
      insp_type = kids.shift.text
      score = kids.shift.text
      kids.shift # just the text Violations (the column header)
      kids.shift # also just a header

      violations = []
      kids.each_slice(2) do |k|
        vio = k.first.text
        pd = k.last.text

        # violations << Violation.new(:violation_text => vio, :point_deduction => pd)
        puts "-------- VIOLATIONS ---------"
        puts "vio_text: #{vio}"
        puts "pd: #{pd}"
      end

      score = score.split(":").last.to_i
      inspection = Inspection.new(:inspection_date => idate, :score => score,
                                  :url => i.href, :violations => violations)
      puts "========== INSPECTIONS ============"
      puts "idate: #{idate}"
      puts "score: #{score}"
      puts "url: #{url}"
      # restaurant.inspections << inspection
      # restaurant.save
    end
  end

end

# url = "http://web3.clackamas.us/healthapp/rim.jsp?q_ID=0311043&q_iID=139510431"
# url = "http://web3.clackamas.us/healthapp/rim.jsp?q_ID=0310262A&q_iID=70512629"
url = ARGV[0] || "http://web3.clackamas.us/healthapp/rim.jsp?q_ID=0310262A&q_iID=59512621"
parse_restaurant_page(url)

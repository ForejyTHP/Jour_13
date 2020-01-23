require 'nokogiri'
require 'open-uri'

def names_nil?(doc)
  finding_names(doc).each do |name|
   if name.nil? == true
    return true
   end
  end
  return false
end

def finding_common_names?(doc)
  ary_names = finding_names(doc)
  if (ary_names.any?("Bitcoin") && ary_names.any?("Ethereum"))
    return true
  end
  return false
end

def values_nil?(doc)
  finding_values(doc).each do |value|
   if value.nil? == true
    return true
   end
  end
  return false
end

def finding_names(doc)
  ary_names = []
  crypto_names = doc.css('tbody')
                    .css("a[title]")
  crypto_names.each do |crypto|
    ary_names.push crypto['title']
  end
  return ary_names
end

def finding_values(doc)
  ary_values = []
  crypto_values= doc.css('tbody')
                    .css("tr[class='cmc-table-row']")
  crypto_values.each do |crypto_values|
    ary_values.push crypto_values.css('a')[1].text
  end
  return ary_values
end

def finding_value_and_name
  html = open("https://coinmarketcap.com/all/views/all/")
  doc = Nokogiri::HTML(html)

  ary_names = finding_names(doc)
  puts "Scraping names : #{ary_names}\n\n"
  sleep(2)
  ary_values = finding_values(doc)
  puts "Scraping values : #{ary_values}\n\n"
  sleep(2)
  hash = ary_names.zip(ary_values).to_h
  puts "Creating hash of names=>values"
  sleep(1)
  pp hash
end

finding_value_and_name




# bitcoin = doc.css('tbody')("a[class='cmc-link']")['title']

# bitcoin.each do |bitcoin|
#   p bitcoin.text
# end

# 1.tbody
# 2.cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name
# 3.cmc-table__column-name cmc-table__column-name--narrow-layout sc-1kxikfi-0 eTVhdN
# 4.balise a class='cmc-link'
  # ('a'[class='cmc-link'])



# Recupere l'interieur de la balise
# css = doc.css(".'balise').text [and .strip]
  # S'il y a plusieurs classes :
  # doc.css(".tout__label.heading.heading--level-4")

# Pour afficher le texte de chaque balise l'une apres l'ature
# stats = doc.css(".tabs-22X2ZQ")
# stats.each do |stat|
#   p stat.text
# end
# pp "stats + #{stats}"

# Pour afficher les attributs d'une balise
# puts stats[].attributes

require 'pry'

def domain_name(url)
  # url_array = url.split(/[\/\.]/) 
  # url_array.select { |i| i.match?(/http/) || i.match?(/www/) || i == "" ? false : true }[0]

  url.split(/[\/\.]/).select { |i| i.match?(/http/) || i.match?(/www/) || i == "" ? false : true }[0]
end



# **Algorithm**
# 1. split string into an array by 'http://', 'www.' and '.com'
# 2. return the element at the index before element containing '.com'



p domain_name("http://github.com/carbonfive/raygun") == "github" 
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"

p domain_name("http://google.com") ==  "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
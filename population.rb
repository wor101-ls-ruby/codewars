require 'pry'

def nb_year(p0, percent, aug, p)
  total_population = p0.to_f
  years = 0
  
  until total_population >= p
    # binding.pry
    total_population = (total_population + ((total_population * percent) / 100) + aug)

    years += 1
  end
  p years
end


p nb_year(1500, 5, 100, 5000) ==  15

# 1000 + 1000 * 0.02 + 50 => 1070 inhabitants
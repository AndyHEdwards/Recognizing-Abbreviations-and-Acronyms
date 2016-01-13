def scan_first_letters(long_form)
  long_form.scan(/(\A\w|(?<=\s)\w)/).join("")
end

def remove_non_words(abbreviation)
  abbreviation.gsub(/\W/, '')
end

def other_letters(long_form)
  long_form.scan(/\B[a-z]/).join("")
end


def categorise_abbreviation(abbreviation, long_form)

  # Essentially what I was trying to do here was check if the abbreviation had all the first letters of the long_form,
  #  and had other letters that were from the original words, that would warrant it a complex abbreviation.

  # if abbreviation.include?(scan_first_letters(long_form)) && abbreviation.include?(other_letters(long_form))
  #   "complex"
  # elsif...

  if remove_non_words(abbreviation) == scan_first_letters(long_form)
    "simple"
  elsif long_form.downcase().include?(abbreviation.downcase())
    "substring"
  else
    nil
  end
end


# Driver code
p categorise_abbreviation("RADIUS", "Remote Authentication Dial In User Service") == "simple"
p categorise_abbreviation("TCP/IP", "Transmission Control Protocol / Internet Protocol") == "simple"
p categorise_abbreviation("Cisco", "San Francisco") == "substring"

p categorise_abbreviation("ragnat", "Teragen International") == "substring"
p categorise_abbreviation("FedEx", "Federal Express") == "complex"



other_letters("Federal Express")

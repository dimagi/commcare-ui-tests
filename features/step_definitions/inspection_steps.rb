Then (/^I see "([^"]*)" above "([^"]*)"$/) do |first,second|
  text_on_screen = query("Textview","text")
  puts text_on_screen

  first_index = text_on_screen.find_index(first)
  if first_index.nil?
      raise "View does not contain text #{first}"
  end

  second_index = text_on_screen.find_index(second)
  if second_index.nil?
      raise "View does not contain text #{second}"
  end

  if first_index > second_index
      raise "Text #{first} was seen below #{second}"
  end
end




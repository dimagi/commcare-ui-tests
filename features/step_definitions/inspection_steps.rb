Then (/^I see "([^"]*)" above "([^"]*)"$/) do |first,second|
  text_on_screen = query("Textview","text")

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

Then (/^I see at least one element of type "([^\"]*)"$/) do |element|
  count = query("#{element}").length
  if count < 1
    fail("Didn't find any occurrences of %s" % text)
  end
end

Then (/^I check that id "([^\"]*)" is enabled$/) do |element_id|
  check_element_exists("* id:'#{element_id}' enabled:'true'")
end

Then (/^I check that id "([^\"]*)" is disabled/) do |element_id|
  check_element_exists("* id:'#{element_id}' enabled:'false'")
end

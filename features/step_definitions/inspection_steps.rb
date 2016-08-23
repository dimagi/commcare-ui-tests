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


Then (/^I scroll until I see the "([^\"]*)" id$/) do |id|
  while true
    break if element_exists("* id:'#{id}'")
    pan_up
  end
end

Then (/^I scroll until I see the "([^\"]*)" text$/) do |text|
  while true
    break if element_exists("* {text CONTAINS[c] '#{text}'}")
    pan_up
  end
end

Then (/^I see (\d+) list entries$/) do |expected_count|
  list_count = query("ListView","getAdapter","getCount").first
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I see (\d+) select options$/) do |expected_count|
  list_count = query("org.commcare.views.widgets.SelectOneWidget", "getChildCount")[0] / 2
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I rename file "([^\"]*)" to "([^\"]*)"$/) do |original_filename, new_filename|
  system("mv #{original_filename} #{new_filename}")
end

Then (/^I don't find the text "([^\"]*)"$/) do |text|
  sleep 1
  count = query("* {text CONTAINS[c] '#{text}'}").length
  if count != 0
    fail("Found %s occurrences of %s; expected none" % [count, text])
  end
end

Then (/^I see an empty EditText$/) do
  wait_for_element_exists("android.widget.EditText text:''")
end



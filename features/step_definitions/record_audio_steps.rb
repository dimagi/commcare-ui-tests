Then(/^I hit record$/) do
    tap_when_element_exists("* {text CONTAINS[c] 'Record Sound'}")
end    

Then(/^I start recording$/) do
    tap_when_element_exists("* {text CONTAINS[c] 'Start Recording'}")
    sleep(3)
    tap_when_element_exists("* {text CONTAINS[c] 'Stop Recording'}")
end    

Then(/^I play audio$/) do
      tap_when_element_exists("* {text CONTAINS[c] 'Play Sound'}")
      sleep(3)
end
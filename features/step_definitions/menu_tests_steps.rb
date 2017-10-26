Then (/^I select Transfer mode/) do
  while true
    break if element_does_not_exist("* {text CONTAINS[c] 'Do you want to send, receive, or submit forms?'}")
    tap_when_element_exists("* {text CONTAINS[c] 'Transfer'}")
    sleep 1
  end
end

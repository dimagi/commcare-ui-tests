Then (/^I logout/) do
  if current_activity() == "CommCareHomeActivity"
    touch("android.support.v7.widget.CardView index:4")
  else
    step("I go back to the home screen")
    touch("android.support.v7.widget.CardView index:4")
  end
end

Then (/^I go back to the home screen$/) do
  while current_activity() != "CommCareHomeActivity"
    press_back_button

    if element_exists("* {text CONTAINS[c] 'EXIT WITHOUT SAVING'}")
      tap_when_element_exists("* {text CONTAINS[c] 'EXIT WITHOUT SAVING'}")
    end

    # wait before checking if we are on the home screen because activity
    # dispatch goes through the home screen causing this to always be true if
    # checked immediately
    sleep 1
  end
end

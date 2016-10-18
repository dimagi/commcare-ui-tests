Then (/^I select "([^\"]*)" menu item$/) do |entry|
  press_menu_button()
  touch("* {text CONTAINS[c] '#{entry}'}")
end

Then (/^I press start$/) do
  wait_for_element_exists("* {text CONTAINS[c] 'Start'}'", timeout: 15)
  touch("android.support.v7.widget.CardView index:0")
end

Then (/^I open incomplete forms$/) do
  touch("* {text CONTAINS[c] 'Incomplete'}")
  wait_for_element_exists("* id:'screen_entity_select_list'", timeout: 60)
end

Then (/^I open saved forms$/) do
  touch("* {text CONTAINS[c] 'Saved'}")
  wait_for_element_exists("* id:'screen_entity_select_list'", timeout: 60)
end

Then (/^I save form as incomplete$/) do
    hide_soft_keyboard()
    press_back_button

    if element_exists("* {text CONTAINS[c] 'SAVE INCOMPLETE'}")
      tap_when_element_exists("* {text CONTAINS[c] 'SAVE INCOMPLETE'}")
    end
    wait_for_element_exists("android.support.v7.widget.CardView index:0", timeout: 60)
end

Then (/^I logout/) do
  if current_activity() != "CommCareHomeActivity"
    step("I go back to the home screen")
  end
  while true
    break if element_exists("* {text CONTAINS[c] 'Logged in'}")
    pan_up
  end
  touch("* {text CONTAINS[c] 'Log out'}")
end

Then (/^I exit form entry$/) do
    hide_soft_keyboard()
    press_back_button

    if element_exists("* {text CONTAINS[c] 'EXIT WITHOUT SAVING'}")
      tap_when_element_exists("* {text CONTAINS[c] 'EXIT WITHOUT SAVING'}")
    end
    sleep 1
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

Then (/^I go to Saved Forms/) do
  if current_activity() != "CommCareHomeActivity"
    step("I go back to the home screen")
  end
  while true
    pan_up
    break if element_exists("* {text CONTAINS[c] 'Saved'}")
  end
  tap_when_element_exists("* {text CONTAINS[c] 'Saved'}")
  wait_for_element_exists("* id:'screen_entity_select_list'", timeout: 60)
end

# ----------------------------
# Form Entry Navigation
# ----------------------------
Then (/^Forward (\d+)/) do |count|
  for _ in 0..(count.to_i - 1)
    tap_when_element_exists("* id:'nav_btn_next'")
  end
end

Then (/^Next$/) do
  tap_when_element_exists("* id:'nav_btn_next'")
end

Then (/^Submit/) do
  if element_exists("* id:'nav_btn_finish'")
    tap_when_element_exists("* id:'nav_btn_finish'")
  else
    tap_when_element_exists("* id:'nav_btn_next'")
  end
end

Then (/^Prev$/) do
  tap_when_element_exists("* id:'nav_btn_prev'")
end

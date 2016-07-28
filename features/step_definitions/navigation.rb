Then (/^I press start/) do
  touch("android.support.v7.widget.CardView index:0")
end

Then (/^I logout/) do
  if current_activity() != "CommCareHomeActivity"
    step("I go back to the home screen")
  end
  index = query("android.support.v7.widget.CardView").length - 1
  touch("android.support.v7.widget.CardView index:#{index}")
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

Then (/^I sync$/) do
  sleep 1
  if current_activity() != "CommCareHomeActivity"
    step("I go back to the home screen")
  end
  index = query("android.support.v7.widget.CardView").length - 2
  touch("android.support.v7.widget.CardView index:#{index}")
  wait_for_element_does_not_exist("android.widget.ProgressBar")
  sleep 1
  count = query("android.widget.ProgressBar")
  if count != 0
    wait_for_element_does_not_exist("android.widget.ProgressBar")
  end
end

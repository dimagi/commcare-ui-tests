Then("I press Name button") do
    nameButton = query("android.widget.ListView android.widget.Button text:'Name'").first
    touch(nameButton)
end
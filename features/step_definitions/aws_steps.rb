Then (/^I turn off the internet$/) do
    system("curl -H \"Content-Type: application/json\" -X POST -d '{\"uplink_bandwidth\": 104857600, \"uplink_delay\": 0, \"uplink_jitter\": 0, \"uplink_loss\": 100, \"downlink_bandwidth\": 104857600, \"downlink_delay\": 0, \"downlink_jitter\": 0, \"downlink_loss\": 100}' http://localhost:32417/set_qos")
end

Then (/^I turn on the internet$/) do
    system("curl -H \"Content-Type: application/json\" -X POST -d '{\"uplink_bandwidth\": 104857600, \"uplink_delay\": 0, \"uplink_jitter\": 0, \"uplink_loss\": 0, \"downlink_bandwidth\": 104857600, \"downlink_delay\": 0, \"downlink_jitter\": 0, \"downlink_loss\": 0}' http://localhost:32417/set_qos")
end
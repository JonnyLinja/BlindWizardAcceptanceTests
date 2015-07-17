# filename: features/step_definitions/leaderboard.rb

When(/^I tap on the Leaderboard button$/) do
    title.leaderboard_button.click
end

Then(/^I should see a list of my high scores$/) do
	expect(leaderboard.num_scores).to eq(10)
end
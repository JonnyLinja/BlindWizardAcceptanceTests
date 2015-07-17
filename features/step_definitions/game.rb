# filename: features/step_definitions/game.rb

# Scenario: Start Game

When(/^I tap on the "Play" button$/) do
    title.play_button.click
end

Then(/^the game should begin$/) do
	game.board
	expect(game.restart_button.displayed?).to eq(false)
end

# Scenario: Next Wave
# Scenario: Timer

When(/^I tap on the “Next Wave” button$/) do
	game.next_wave_button.click
end

When(/^I wait a few seconds$/) do
	sleep(7)
end

Then(/^a new row of Enemies appear$/) do
	expect(game.enemy_exists('Enemy'+(game.num_columns*3).to_s)).to eq(true)
end

# Scenario: Swipe

Given(/^I am playing the game$/) do
	title.play_button.click
end

When(/^I swipe horizontally$/) do
    game.enemy(0)
	game.swipe_first_row_left
end

Then(/^the Enemies in the row shift one space in that direction$/) do
	expect(game.enemy(1).location.x).to eq(0)
end

And(/^the Enemy at the end of the row gets moved to the beginning of the row$/) do
	expect(game.enemy(0).location.x).to eq(window_size.width-game.enemy(0).size.width)
end

# Scenario: Points

When(/^I match 3 or more Enemies in a row\/column$/) do
    game.enemy(0)
	game.swipe_second_row_left
end

Then(/^those Enemies disappear$/) do
	sleep(3)
	expect(game.enemy_exists('Enemy0')).to eq(false)
end

And(/^I get points$/) do
	expect(game.score).to be >= 9
end

# Scenario: End Game

When(/^an Enemy reaches the top of the screen$/) do
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
end

Then(/^I lose$/) do
	expect(game.restart_button.displayed?).to eq(true)
end

# Scenario: Restart

Given(/^I lose the game$/) do
	title.play_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
	game.next_wave_button.click
end

When(/^I tap on the retry button$/) do
	game.restart_button.click
end

Then(/^the game starts again$/) do
	expect(game.restart_button.displayed?).to eq(false)
end
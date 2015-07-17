# filename: features/leaderboard.feature

Feature: Leaderboard
	As an iPhone user
	I want to view the leaderboard of high scores
	So that I can show off

Scenario: Tap on Leaderboard
	Given I open the app
	When I tap on the Leaderboard button
	Then I should see a list of my high scores

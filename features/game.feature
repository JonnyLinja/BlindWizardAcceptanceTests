# filename: features/game.feature

Feature: Game
	As an iPhone user
	I want to play the Blind Wizard App
	So that I can kill time

Scenario: Start Game
	Given I open the app
	When I tap on the "Play" button
	Then the game should begin

Scenario: Next Wave
	Given I am playing the game
	When I tap on the “Next Wave” button
	Then a new row of Enemies appear

Scenario: Timer
	Given I am playing the game
	When I wait a few seconds
	Then a new row of Enemies appear

Scenario: Swipe
	Given I am playing the game
	When I swipe horizontally
	Then the Enemies in the row shift one space in that direction
	And the Enemy at the end of the row gets moved to the beginning of the row

Scenario: Points
	Given I am playing the game
	When I match 3 or more Enemies in a row/column
	Then those Enemies disappear
	And I get points

Scenario: End Game
	Given I am playing the game
	When an Enemy reaches the top of the screen
	Then I lose

Scenario: Restart
	Given I lose the game
	When I tap on the retry button
	Then the game starts again
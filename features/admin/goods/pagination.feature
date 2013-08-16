Feature: Pagination goods
	
	Scenario: Show goods list on index page
		Given I am a new, authenticated user
		And 40 goods exist
		When I go to the admin goods page
		Then only 20 last goods should be shown in table

	Scenario: Show goods by page
		Given I am a new, authenticated user
		And 50 goods exist
		When I visit admin goods page number 2
		Then goods since 21 to 40 should be shown in table

	Scenario: Show pagination links
		Given I am a new, authenticated user
		And 30 goods exist
		When I go to the admin goods page
		Then pagination links should be shown
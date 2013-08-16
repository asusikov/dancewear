Feature: Goods on index page
	
	Scenario: Show goods on index page
		Given 20 goods exist
		When I go to the goods page
		Then only 10 last goods should be shown

	Scenario: Show goods by page
		Given 30 goods exist
		When I visit goods index page number 2
		Then goods since 11 to 20 should be shown

	Scenario: Show pagination links
		Given 30 goods exist
		When I go to the goods page
		Then pagination links should be shown

	Scenario: Show goods from category
		Given 3 sections exist
		And a section "Shoes" exist with title: "#1"
		And 3 categories exist
		And a category "Women" exist with section: section "Shoes"
		And 40 goods exist with category: category "Women"
		And 20 goods exist 
		When I go to the category "Women" page
		Then only 10 last goods from category "Women" should be shown
		And category "Women" should be current in menu

	Scenario: Show goods from section
		Given 3 sections exist
		And a section "Shoes" exist
		And a category "Women" exist with section: section "Shoes"
		And a category "Men" exist with section: section "Shoes"
		And a category exist
		And 40 goods exist with category: category "Women"
		And 40 goods exist with category: category "Men"
		And 20 goods exist
		When I go to the section "Shoes" page
		Then only 10 last goods from section "Shoes" should be shown
		And section "Shoes" should be current in menu

	Scenario: Show announcement
		Given a good exists
		When I go to the goods page
		Then I should see title of good
		And I should see announcement of good
		And I should see price of good

	Scenario: Show avatar
		Given a good exists
		When I go to the goods page
		Then I should see thumb avatar of good

	Scenario: Show default avatar
		Given a good exists with avatar: nil
		When I go to the goods page
		Then I should see default good's thumb avatar

	Scenario: Jump to good page by click title
		Given a good exists 
		When I go to the goods page
		And I click by good title
		Then I should be at the good page

	Scenario: Good page
		Given a good exists
		When I go to the good page
		Then I should see title of good
		And I should see price of good
		And I should see description of good
		And I should see full avatar of good

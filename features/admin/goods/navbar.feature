Feature: Navbar on goods page

	Scenario: Show navbar on goods index page
		Given I am a new, authenticated user
		When I go to the admin goods page
		Then I should see navbar

	Scenario: Show sections and categories in navbar
		Given I am a new, authenticated user
		And a section "Shoes" exists
		And 6 categories exist
		And 3 categories exist with section: section "Shoes"
		When I go to the admin goods page
		Then all sections should be shown in navbar
		And all categories should be shown in navbar

	Scenario: Jump to goods list on section page
		Given I am a new, authenticated user
		And a section "Shoes" exists
		When I go to the admin goods page
		And I click by section "Shoes" title in navbar on goods page
		Then I should be at the admin section "Shoes" goods page

	Scenario: Jump to goods list on category page
		Given I am a new, authenticated user
		And a category "Dance shoes" exists
		When I go to the admin goods page
		And I click by category "Dance shoes" title in navbar on goods page
		Then I should be at the admin category "Dance shoes" goods page

	Scenario: Active section link
		Given I am a new, authenticated user
		And a section "Shoes" exists
		When I go to the admin section "Shoes" goods page
		Then link to section "Shoes" in navbar should be active

	Scenario: Active section link
		Given I am a new, authenticated user
		And a category "Dance shoes" exists
		When I go to the admin category "Dance shoes" goods page
		Then link to category "Dance shoes" in navbar should be active
Feature: Goods in admin part

	Scenario: Show link in toolbar
		Given I am a new, authenticated user
		When I go to the admin page
		Then I should see goods link

	Scenario Outline: Denied access for unauthorized user
		Given I am not authenticated
		And a good exists
		When I go to the <page> page
		Then I should see log in form
	Examples:
		| page            |
		| admin goods     |
		| admin good      |
		| edit admin good |

	Scenario: Show goods from category
		Given I am a new, authenticated user
		Given a section "Shoes" exist with title: "#1"
		And 3 categories exist
		And a category "Women" exist with section: section "Shoes"
		And 40 goods exist with category: category "Women"
		And 20 goods exist 
		When I go to the admin category "Women" goods page
		Then only 20 last goods from category "Women" should be shown in table
		And category "Women" should be current in navbar

	Scenario: Show goods from section
		Given I am a new, authenticated user
		Given a section "Shoes" exist
		And a category "Women" exist with section: section "Shoes"
		And a category "Men" exist with section: section "Shoes"
		And a category exist
		And 40 goods exist with category: category "Women"
		And 40 goods exist with category: category "Men"
		And 20 goods exist
		When I go to the admin section "Shoes" goods page
		Then only 20 last goods from section "Shoes" should be shown in table
		And section "Shoes" should be current in navbar

	Scenario Outline: Show new button on page
		Given I am a new, authenticated user
		And a section "Shoes" exist
		And a category "Dance shoes" exist with section: section "Shoes"
		When I go to the admin <page> page
		Then new category button <visible> be visible
	Examples:
		| page                         | visible    |  
		| goods                        | should not |  
		| section "Shoes" goods        | should not |  
		| category "Dance shoes" goods | should     |  

	Scenario: Jump to new good page
		Given I am a new, authenticated user
		And a category "Dance shoes" exist
		When I go to the admin category "Dance shoes" goods page
		And I click by new button
		Then I should be at the new admin category "Dance shoes" good page

	Scenario: Jump to good page
		Given I am a new, authenticated user
		And a good exists
		When I go to the admin goods page
		And I click by good title
		Then I should be at the admin good page

	Scenario: Show info of good
		Given I am a new, authenticated user
		And a good exists
		When I go to the admin good page
		Then I should see full info of good

	Scenario Outline: Jump to edit good page
		Given I am a new, authenticated user
		And a good exist
		When I go to the admin <page> page
		And I click by edit good button
		Then I should be at the edit admin good page
	Examples:
		| page  |  
		| goods |  
		| good  |  

	Scenario Outline: Destroy good
		Given I am a new, authenticated user
		And a good exist
		When I go to the admin <page> page
		And I click by destroy good button
		Then 0 goods should exist
		And I should be at the admin goods page
		And I should see success flash message
	Examples:
		| page  |  
		| goods |  
		| good  |  

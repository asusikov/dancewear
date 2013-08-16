Feature: Categories in admin part

	Scenario Outline: Denied access for unauthorized user
		Given I am not authenticated
		And a category exists
		When I go to the <page> page
		Then I should see log in form
	Examples:
		| page                |
		| admin categories    |
		| admin category      |
		| edit admin category |

	Scenario: Show navbar on categories index page
		Given I am a new, authenticated user
		When I go to the admin categories page
		Then I should see navbar

	Scenario: Show section in navbar
		Given I am a new, authenticated user
		And 3 sections exist
		When I go to the admin categories page
		Then all sections should be shown in navbar

	Scenario: Show categories list on index page
		Given I am a new, authenticated user
		And 15 categories exist
		When I go to the admin categories page
		Then all categories should be shown in table

	Scenario Outline: Show new button on page
		Given I am a new, authenticated user
		And a section "Shoes" exist with title: "#1"
		And 3 categories exist with section: section "Shoes"
		When I go to the admin <page> page
		Then new category button <visible> be visible
	Examples:
		| page                       | visible    |  
		| categories                 | should not |  
		| section "Shoes" categories | should     |  

	Scenario: Jump to new section page
		Given I am a new, authenticated user
		And a section "Shoes" exist with title: "#1"
		When I go to the admin section "Shoes" categories page
		And I click by new button
		Then I should be at the new admin section "Shoes" category page

	Scenario: Show categories list on section page
		Given I am a new, authenticated user
		And 3 sections exist
		And a section "Shoes" exist with title: "#1"
		And 3 categories exist
		And 3 categories exist with section: section "Shoes"
		When I go to the admin section "Shoes" categories page
		Then I should see categories from section "Shoes" in table
		And section "Shoes" should be current in navbar

	Scenario: Jump to categories list on section page from navbar
		Given I am a new, authenticated user
		And a section "Shoes" exist
		When I go to the admin categories page
		And I click by section "Shoes" title in navbar
		Then I should be at the admin section "Shoes" categories page

	Scenario: Jump to categories list on section page from table
		Given I am a new, authenticated user
		And a section "Shoes" exist
		And a category exist with section: section "Shoes"
		When I go to the admin categories page
		And I click by section "Shoes" title in table
		Then I should be at the admin section "Shoes" categories page

	Scenario: Jump to category page
		Given I am a new, authenticated user
		And a category exists
		When I go to the admin categories page
		And I click by category title
		Then I should be at the admin category page

	Scenario: Show info of category
		Given I am a new, authenticated user
		And a category exists
		When I go to the admin category page
		Then I should see info of category

	Scenario Outline: Jump to edit category page
		Given I am a new, authenticated user
		And a category exist
		When I go to the admin <page> page
		And I click by edit category button
		Then I should be at the edit admin category page
	Examples:
		| page       |  
		| categories |  
		| category   |  

	Scenario Outline: Destroy category
		Given I am a new, authenticated user
		And a category exist
		When I go to the admin <page> page
		And I click by destroy category button
		Then 0 categories should exist
		And I should be at the admin categories page
		And I should see success flash message
	Examples:
		| page       |  
		| categories |  
		| category   |  
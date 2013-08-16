Feature: Categories list

	Scenario: Show categories list on section page
		Given 3 sections exist
		And a section "Shoes" exist
		And 3 categories exist with section: section "Shoes"
		When I go to the section "Shoes" page
		Then I should see categories from section "Shoes"
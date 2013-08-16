require "spec_helper"

describe Good do

	context '#by_catalog_item' do
		it 'returns all goods if no category and section passing' do
			ids = []
			10.times{ ids.unshift create(:good).id }
			good_ids = Good.by_catalog_item.map{ |item| item.id }
			good_ids.should == ids
		end

		def self.it_return_from_category_by(field)
			it "returns goods from category if category #{field} passing" do
				ids = []
				10.times{ create(:good) }
				category = create(:category)
				10.times{ ids.unshift create(:good, :category => category).id }
				good_ids = Good.by_catalog_item(:category_id => category.send(field)).map{ |item| item.id }
				good_ids.should == ids
			end
		end
		it_return_from_category_by :id
		it_return_from_category_by :slug
		
		def self.it_return_from_section_by(field)
			it "returns goods from section if section #{field} passing" do
				ids = []
				10.times{ create(:good) }
				section = create(:section)
				3.times do
					category = create(:category, :section => section)
					3.times{ ids.unshift create(:good, :category => category).id }
				end
				good_ids = Good.by_catalog_item(:section_id => section.send(field)).map{ |item| item.id }
				good_ids.should == ids
			end
		end
		it_return_from_section_by :id
		it_return_from_section_by :slug

	end

end

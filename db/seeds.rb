puts 'Delete static pages'
StaticPage.delete_all
puts 'Create contacts static page'
StaticPage.create(:title => 'Contacts', :body => '<h2>Our contacts</h2>')

puts 'Delete posts'
Post.delete_all
puts 'Create posts'
created_at = Time.now
40.times do |index|
	post = Post.create(:title => Faker::Lorem.sentence, :announcement => Faker::Lorem.paragraph, :body => Faker::Lorem.paragraphs)
	post.created_at = created_at + index
	post.save
end

puts 'Delete goods'
Good.delete_all
puts 'Delete sections'
Section.delete_all
puts 'Delete categories'
Category.delete_all
puts 'Create sections'
created_at = Time.now
5.times do |index|
	section = Section.create(:title => Faker::Lorem.words(2).join(' ').capitalize)
	section.save
	puts "Create categories for section #{section.title}"
	3.times do |category_index| 
		category = section.categories.create(:title => Faker::Lorem.words(2).join(' ').capitalize)
		puts "Create goods for category #{category.title}"
		40.times do |good_index|
			good = category.goods.create(
				:title => Faker::Lorem.sentence, 
				:announcement => Faker::Lorem.paragraph, 
				:description => Faker::Lorem.paragraph, 
				:price => rand(1000)
			)
			good.created_at = created_at + index * 100 + category_index * 1000 +  good_index
			good.save
		end
	end
end

puts 'Delete users'
User.delete_all
puts 'Create admin'
User.create(:email => 'admin@example.com', :password => '12345678')

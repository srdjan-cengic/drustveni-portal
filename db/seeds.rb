require 'bcrypt'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Category.create(:id => 1, :category_name => 'slike')
Category.create(:id => 2, :category_name => 'statusi')

UserRole.delete_all
UserRole.create(:id => 1, :role_name => 'administrator')
UserRole.create(:id => 2, :role_name => 'creator')

User.delete_all
first_users = [{username: 'mvistica',   password: 'mvistica',   role: 1}, 
			   {username: 'mmilicevic', password: 'mmilicevic', role: 1},
			   {username: 'scengic',    password: 'scengic',    role: 2},
			   {username: 'dhusic',     password: 'dhusic',     role: 2}]

first_users.each_with_index do |user, index|
	salt = BCrypt::Engine.generate_salt
	hash = BCrypt::Engine.hash_secret(user[:password], salt)

	User.create(:id => index + 1,
		        :username => user[:username], 
		        :password_salt => salt, 
		        :password_hash => hash, 
		        :user_role_id => user[:role])
end

Entry.delete_all
Entry.create(:id => 1, :status => "A", :category_id => 1, :user_id => 1)
Entry.create(:id => 2, :status => "A", :category_id => 2, :user_id => 1)
Entry.create(:id => 3, :status => "A", :category_id => 1, :user_id => 2)
Entry.create(:id => 4, :status => "A", :category_id => 2, :user_id => 2)
Entry.create(:id => 5, :status => "A", :category_id => 1, :user_id => 3)
Entry.create(:id => 6, :status => "A", :category_id => 2, :user_id => 3)
Entry.create(:id => 7, :status => "A", :category_id => 1, :user_id => 4)
Entry.create(:id => 8, :status => "A", :category_id => 1, :user_id => 4)

Storage.delete_all
Storage.create( :id => 1, 
	            :title => "Moja prva uplodovana slika",
	            :content => "https://apppadvanced.s3-external-3.amazonaws.com/vl1_1380271123.jpg",
	            :entry_id => 1)

Storage.create( :id => 2,
				:title => "#1",
	            :content => "Dijete sam gluhonjemih roditelja. 
					         Imam sestru koja se bavi pjevanjem. 
					         Mama i tata su joj uvijek bili podrska u tome, iako je nikada u 
					         zivotu nisu culi.",
	            :entry_id => 2)

Storage.create( :id => 3, 
	            :title => "Tell 'Em Why",
	            :content => "http://d24w6bsrhbeh9d.cloudfront.net/photo/a3YwEw3_460s.jpg",
	            :entry_id => 3)

Storage.create( :id => 4,
				:title => "#2",
	            :content => "Takodje, kad idem sa majkom na pijacu uvek teram da uzmemo kod nekih baba i deda, 
	                         jer ono realno, oni zive od toga. Nekako mi je zao da gledam kako se muce, stoje tu, 
	                         nadaju se da ce neko da kupi nesto kod njih, a nemaju lagodan zivot i lepu penziju 
	                         kao i njihovi vrsnjaci iz drugih zemalja.",
	            :entry_id => 4)

Storage.create( :id => 5, 
	            :title => "Free healthcare, education, whatever...",
	            :content => "http://d24w6bsrhbeh9d.cloudfront.net/photo/a8WG7gY_460s.jpg",
	            :entry_id => 5)

Storage.create( :id => 6,
				:title => "#3",
	            :content => "Na pijaci uvek kupujem kod starijih baka i deka! Nekako su mi drazi.",
	            :entry_id => 6)

Storage.create( :id => 7,
				:title => "So I got that",
	            :content => "http://d24w6bsrhbeh9d.cloudfront.net/photo/av05den_460s.jpg",
	            :entry_id => 7)

Storage.create( :id => 8,
				:title => "Cat owners will understand this. Every fucking time.",
	            :content => "http://d24w6bsrhbeh9d.cloudfront.net/photo/a2N7w9Y_460s_v2.jpg",
	            :entry_id => 8)

Vote.delete_all
Vote.create(:id => 1, :count => 1433, :storage_id => 1)
Vote.create(:id => 2, :count => 1779, :storage_id => 2)
Vote.create(:id => 3, :count => 9, :storage_id => 3)
Vote.create(:id => 4, :count => 81, :storage_id => 4)
Vote.create(:id => 5, :count => 3779, :storage_id => 5)
Vote.create(:id => 6, :count => 458, :storage_id => 6)
Vote.create(:id => 7, :count => 9898, :storage_id => 7)
Vote.create(:id => 8, :count => 458, :storage_id => 8)


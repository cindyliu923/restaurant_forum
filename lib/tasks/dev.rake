namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    200.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
# remote_image_url: "http://lorempixel.com/335/180/food/",因為設定default image就不用先上傳照片 
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: user_name,
        email: "#{user_name}@example.com",
        password: "12345678")
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|   
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample)
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comment data"
  end

  task fake_ranking: :environment do
    200.times do
      Favorite.create!(user: User.all.sample, restaurant: Restaurant.all.sample)
      Like.create!(user: User.all.sample, restaurant: Restaurant.all.sample)
    end
    puts "have created #{Favorite.count} fake favorites"    
    puts "have created #{Like.count} fake likes"
  end

end

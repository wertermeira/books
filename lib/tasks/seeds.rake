namespace :seeds do
  desc "TODO"
  task user: :environment do
    puts "create user admin"
    user = User.create!(
        name: "werter meira",
        email: "wertermeira@gmail.com",
        password: "123456",
        password_confirmation: "123456",
        admin: true,
        status: true
    )
  end

  desc "TODO"
  task users: :environment do
  end

  desc "TODO"
  task books: :environment do
    types = ['sports', 'animals', 'food', 'city', 'fashion','nature','people','business', 'cats']
    30.times do
      book = Book.new(
          name: Faker::Book.title,
          description: Faker::Lorem.paragraph(3),
          author: Faker::Book.author,
          image:          Faker::LoremPixel.image("200x200", false, types.sample),
          status: true,
          user_id: User.last.id
      )
      if book.save
        puts "Name: #{book.name}"
      else
        puts "Error in create"
      end
    end
  end

end

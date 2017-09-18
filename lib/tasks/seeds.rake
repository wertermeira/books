namespace :seeds do
  # user admin
  def user
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
  task user: :environment do
    user
  end

  # users list
  def users(eq = 5)
    eq.times do
      name = Faker::Name.name
      set_password = Faker::Internet.password(8)
      puts "create user "
      user = User.create!(
          name: name,
          email: Faker::Internet.email,
          password: set_password,
          password_confirmation: set_password,
          admin: true,
          status: true
      )
    end
  end

  desc "TODO"
  task users: :environment do
    users(5)
  end

  def books(eq)
    #types = ['sports', 'animals', 'food', 'city', 'fashion','nature','people','business', 'cats']
    books_cover = [
        'https://cdn.cp.adobe.io/content/2/rendition/31b31ba1-2552-4bb0-8a81-1e907dc293e6/artwork/7b902897-aa35-4673-a58f-e06d7b785a4c/version/3/format/jpg/dimension/width/size/1200',
        'https://cdn.cp.adobe.io/content/2/rendition/7a406688-7e5c-400c-b84d-140f297d229d/artwork/53298b5a-c870-46b7-a3e4-f6451bc22901/version/3/format/jpg/dimension/width/size/1200',
        'https://cdn.cp.adobe.io/content/2/rendition/fba70072-defd-464e-8306-6c72b8c94355/artwork/b0a8828d-a089-4508-9ca3-a318d7a09465/version/2/format/jpg/dimension/width/size/1200',
        'http://bookcoverarchive.com/wp-content/uploads/2016/02/81SlNLr3ZoL.jpg',
        'http://bookcoverarchive.com/wp-content/uploads/2015/10/witches-of-america.jpg',
        'http://bookcoverarchive.com/wp-content/uploads/2015/09/reason-for-flowers.jpg',
        'http://bookcoverarchive.com/wp-content/uploads/2015/09/Near-to-the-Wild-Heart.jpg'
    ]
    eq.times do
      book = Book.new(
          name: Faker::Book.title,
          description: Faker::Lorem.paragraph(3),
          author: Faker::Book.author,
          #image:          Faker::LoremPixel.image("344x500", false, types.sample),
          image: books_cover.sample,
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

  desc "TODO"
  task books: :environment do
    books(30)
  end

  desc "TODO"
  task start: :environment do
    user
    users(5)
    books(30)
  end

end

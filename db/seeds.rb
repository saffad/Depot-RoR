# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(title: 'Software Engineering',
  description: 
    %{<p>
        Software Engineering presents a broad perspective on software systems 
        engineering, concentrating on widely used techniques for developing 
        large-scale systems. The book supports students taking undergraduate 
        or graduate courses in software engineering, and software engineers in 
        industry needing to update their knowledge.
      </p>},
  image_url:   'se.jpg',    
  price: 50.00)
# . . .
Product.create(title: 'Projects in Computing and Information Systems: A Students Guide',
  description:
    %{<p>
        This book is the essential guide for any student undertaking a 
        computing/IS project, and will give them everything they need 
        to achieve outstanding results.
      </p>},
  image_url: 'proj.jpg',
  price: 30.99)
# . . .

Product.create(title: 'Objects First with Java: A Practical Introduction Using BlueJ',
  description: 
    %{<p>
        This book is an introduction to object-oriented programming for beginners. 
        The main focus of the book is general object-oriented and programming concepts 
        from a software engineering perspective.
      </p>},
  image_url: 'java.jpg',
  price: 43.99)

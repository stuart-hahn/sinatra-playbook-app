# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- My ApplicationController inherits from Sinatra::Base and any other controllers I build will inherit from my ApplicationController. This gives us access to methods like 'get' and 'post'. For the methods 'patch' and 'delete' we need to add Rack::MethodOverride into our config.ru file, which is also where we mount our controllers.
- [x] Use ActiveRecord for storing information in a database
- ActiveRecord is my ORM. My Rakefile requires 'sinatra/activerecord/rake' which lets me use rake tasks to create migrations. Migrations allow me to build tables in my database that reflect my models, and my models inherit from ActiveRecord::Base. ActiveRecord provides methods for basic CRUD functionality and makes it easy to make models that accurately reflect our database tables.
- [x] Include more than one model class (e.g. User, Post, Category)
- I have a User model and a Play model.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- In my app, a User has_many Plays.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- In my app, a Play belongs_to User.
- [x] Include user accounts with unique login attribute (username or email)
- My app uses bcrypt to authenticate unique login attributes (I'm using email).
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
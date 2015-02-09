#IDEAS FACTORY (made by Tabish with RoR)
this is to be used for CC quiz 2, and was made for a "practice run before the quiz"

###below is a walk-through of the app components as they are made:

```shell
####currently contains two models (User and Ideas)
rails g model:User title:string explanation:text

```
-other model created with devise

```shell
  #added belongs_to User in the idea.rb model file
  #added has_many Ideas in the user.rb model file
```

-needed a new migration file to consumate the 1 to many relationship between the two models

```shell
rails g migration add_user_references_to_ideas user:references

#this put a user_id column in the ideas table
#this added a foreign key to the user table that references the ideas
```


#begin working on views
-added "navbar will go here" in application.html.erb file 
-added "all the ideas will get listed here" in index.html.erb file
-this was done purely for placeholding purposes
-when server is run, both those lines show up

#boostrap integration
```shell

#installed gem:
gem 'bootstrap-sass', '~> 3.3.3'

#ran bundle install


#created a new file called "b00tstrapzz.css.scss" inside the app/assets/stylesheets folder

#inside that file put this:
@import "bootstrap-sprockets";
@import "bootstrap";


#that file gets run thanks to the app/assets/appliation.css file - thats the manifest file for all css docs in this rails project, it has a line that says requires tree meaning all css files within the stylesheets folder get read as long as that manifest file is there.

```





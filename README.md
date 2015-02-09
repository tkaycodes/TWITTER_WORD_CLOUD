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




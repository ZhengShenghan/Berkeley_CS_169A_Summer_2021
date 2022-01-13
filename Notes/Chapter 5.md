# Chapter 5:SaaS Framework: Advanced Programming Abstractions for SaaS

1. aspect-oriented programming：a programming paradigm which complements Object-Oriented Programming (OOP) by separating *concerns* of a software application to improve modularization. 
2. SSO：log in A by credential of B, without letting A know the credential of B

#### 5.1 DRYing Out MVC: Partials, Validations and Filters 

core content of rails : DRY—Don’t Repeat Yourself

rails achieve this by 3 mechanisms: model validations, view partials, and controller filters

##### 1.partial views

Advice is code that implements cross-cutting concerns

A partial is Rails’ name for a reusable chunk of a view. We can factor out some code into partial and include them as reference

Partials rely heavily on convention over configuration, their name must starts with 1 underscoe

DRY philosophy urges constraints on entities or actions into one place(only allow special member to modify or change sth)--->validations for models and filters for controllers

1. Validation checks: apply when you use Valid? or try to save model(collect constraints for a model in a single place)
2. controller filter: a method that checks whether certain conditions are true before an action is run, or sets up common conditions that many actions rely on(a user must login before doing some interactions, so basically it lets you collect conditions for affecting many controller actions in a single place. It's ran before those actions)It can immediate call render or redirect. 

The errors field of a model, an ActiveRecord::Errors object, records errors that occurred during validation

#### 5.2 Single Sign-On and Third-Party Authentication 

one way to be DRY: avoid implement functionality that provided with other sevices.

SSO process:

1. user clicks link
2. go to a login page served securely by the provider
3. user can login to the provider and decide what privileges to grant the requesting app

The interaction only involves user and provider(no app)

4. If authentication succeeded, provider generates a HTTP route POST to app(the POST contains access token)

Then the app can 

	1. assume user has proved identity to the provider and app will record the provider’s persistent user-ID(use sessions)
	2. It can use the token to request further information about the user from the provider

#### 5.4 Associations and Foreign Keys 

association：logical relationship between two types of entities in a software architecture（like function one to many）

foreign keys: a column in one table whose job is to reference the primary key of another table to establish an association between the objects represented by those tables

find review through Cartesian product:

1. do cartesian product of all the rows of the movies and reviews tables by concatenating each row of the movies table with each possible row of the reviews table
2. select only those rows for which the id from the movies table equals the movie_id from the reviews table

belongs_to :movie gives Review objects a movie instance method that looks up and returns the movie to which this review belongs

ActiveRecord’s Association creates new methods to traverse associations by constructing quieries. But a necessary foreign key fields should be added yourself using migration

#### 5.5 Through-Associations 

key concept :Moviegoers are related to Movies through their reviews

new_review = Review.new(...)

new_review.movie = movie

new_review.moviegoer = moviegoer

<==> new_review = moviegoer.reviews.create(:movie => movie)  but in the second version , you should set up your validation for that.

class Moviegoer 

​	has_many : reviews

​	has_many : movies , : through => : reviews

Additional options to association methods control what happens to “owned” objects when an “owning” object is destroyed.

EX:

has_many :reviews, dependent: destroy

the review should be deleted if the corresponding movie is destroyed

!!!!!

1. When two models A and B each have a has-one or has-many relationship to a common third model C, a many-to-many association between A and B can be established through C
2. the 2 Moviegoer and movies must have direct relation with review to let through work

#### 5.6 RESTful Routes for Associations 

The RESTful way to create routes for associations is to capture the IDs of both the resource itself and its associated item(s) in a “nested” route URI

When manipulating “owned” resources that have a parent, such as Reviews that are “owned by” a Movie, before-filters can be used to capture and verify the validity of the IDs embedded in the RESTful nested route

this nested resource route specification provides a set of RESTful URI helpers for CRUD actions on reviews that are owned by a movie. We add new routes like GET /movies/:movie_id/reviews which is 'index' for helper method movie_reviews_path(m)

Note that via convention over configuration, the URI wildcard :id will match the ID of the resource itself—that is, the ID of a review—and Rails chooses the “outer” resource name to make :movie_id capture the ID of the “owning” resource. The ID values will therefore be available in controller actions as params[:id] (the review) and params[:movie_id] 



#### 5.8 Other Types of Code 

#### 5.9 Fallacies and Pitfalls 

#### 5.10 Concluding Remarks: Languages, Productivity, and Beauty 


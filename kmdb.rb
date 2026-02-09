# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Actor.destroy_all
Agent.destroy_all
Role.destroy_all
Movie.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# Generated these via the terminal commands discussed in class. See migration files for more information.

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
# puts "Actors: #{Actor.all.count}" #expect 0; Test pass; ensured functionality
# Add studio
studio_helper = Studio.new
studio_helper["Name"] = "Warner Bros."
studio_helper.save

# Add initial movie data
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = Studio.find_by(Name: "Warner Bros.")["id"]
batman_begins.save 

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = Studio.find_by(Name: "Warner Bros.")["id"]
dark_knight.save

knight_rises = Movie.new
knight_rises["title"] = "The Dark Knight Rises"
knight_rises["year_released"] = 2012
knight_rises["rated"] = "PG-13"
knight_rises["studio_id"] = Studio.find_by(Name: "Warner Bros.")["id"]
knight_rises.save

# Add actors to their database
total_cast = ["Christian Bale", "Michael Caine", "Liam Neeson", "Katie Holmes",
 "Gary Oldman", "Heath Ledger", 
 "Aaron Eckhart", "Maggie Gyllenhaal", "Tom Hardy",
 "Joseph Gordon-Levitt", "Anne Hathaway"]

for name in total_cast
  actor_helper = Actor.new
  actor_helper["name"] = name
  actor_helper.save
end

# Add agent name
agent_helper = Agent.new
agent_helper["name"] = "Ari Emanuel"
agent_helper.save

# Match foreign keys to assign roles and agents
# Batman Begins Roles
role_helper = Role.new
role_helper["character_name"] = "Bruce Wayne"
role_helper["actor_id"] = Actor.find_by(name: "Christian Bale")["id"]
role_helper["movie_id"] = Movie.find_by(title: "Batman Begins")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Alfred"
role_helper["actor_id"] = Actor.find_by(name: "Michael Caine")["id"]
role_helper["movie_id"] = Movie.find_by(title: "Batman Begins")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Ra's Al Ghul"
role_helper["actor_id"] = Actor.find_by(name: "Liam Neeson")["id"]
role_helper["movie_id"] = Movie.find_by(title: "Batman Begins")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Rachel Dawes"
role_helper["actor_id"] = Actor.find_by(name: "Katie Holmes")["id"]
role_helper["movie_id"] = Movie.find_by(title: "Batman Begins")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Commissioner Gordon"
role_helper["actor_id"] = Actor.find_by(name: "Gary Oldman")["id"]
role_helper["movie_id"] = Movie.find_by(title: "Batman Begins")["id"]
role_helper.save

# Dark Knight Roles
role_helper = Role.new
role_helper["character_name"] = "Bruce Wayne"
role_helper["actor_id"] = Actor.find_by(name: "Christian Bale")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Alfred"
role_helper["actor_id"] = Actor.find_by(name: "Michael Caine")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Joker"
role_helper["actor_id"] = Actor.find_by(name: "Heath Ledger")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Rachel Dawes"
role_helper["actor_id"] = Actor.find_by(name: "Maggie Gyllenhaal")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Commissioner Gordon"
role_helper["actor_id"] = Actor.find_by(name: "Gary Oldman")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Harvey Dent"
role_helper["actor_id"] = Actor.find_by(name: "Aaron Eckhart")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight")["id"]
role_helper.save

# Dark Knight Rises Roles
role_helper = Role.new
role_helper["character_name"] = "Bruce Wayne"
role_helper["actor_id"] = Actor.find_by(name: "Christian Bale")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight Rises")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Commissioner Gordon"
role_helper["actor_id"] = Actor.find_by(name: "Gary Oldman")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight Rises")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Bane"
role_helper["actor_id"] = Actor.find_by(name: "Tom Hardy")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight Rises")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "John Blake"
role_helper["actor_id"] = Actor.find_by(name: "Joseph Gordon-Levitt")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight Rises")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Selina Kyle"
role_helper["actor_id"] = Actor.find_by(name: "Anne Hathaway")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight Rises")["id"]
role_helper.save

role_helper = Role.new
role_helper["character_name"] = "Alfred"
role_helper["actor_id"] = Actor.find_by(name: "Michael Caine")["id"]
role_helper["movie_id"] = Movie.find_by(title: "The Dark Knight Rises")["id"]
role_helper.save

# Match Agent to Christian Bale
agent_bale = Actor.find_by(name: "Christian Bale")
agent_bale["agent_id"] = Agent.find_by(name: "Ari Emanuel")["id"]
agent_bale.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!

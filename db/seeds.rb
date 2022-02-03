Movie.destroy_all
Director.destroy_all

stanley = Director.create!(name: 'Stanley Kubrick', active: false, awards_won: 26)
wes = Director.create!(name: 'Wes Anderson', active: true, awards_won: 11)
denis = Director.create!(name: 'Denis Villenueve', active: true, awards_won: 9)
terry = Director.create!(name: 'Terry Gilliam', active: true, awards_won: 9)
# david = Director.create!(name: 'David Lynch', active: true, awards_won: 16)
# alfred = Director.create!(name: 'Alfred Hitchcock', active: false, awards_won: 9)

stanley.movies.create!(title: '2001: A Space Odyssey', recently_viewed: true, length: 142, genre: 'Sci-Fi')
stanley.movies.create!(title: 'The Shining', recently_viewed: false, length: 146, genre: 'Horror')
stanley.movies.create!(title: 'Dr. Strangelove', recently_viewed: false, length: 94, genre: 'Sci-Fi')
stanley.movies.create!(title: 'Clockwork Orange', recently_viewed: false, length: 136, genre: 'Sci-Fi')

wes.movies.create!(title: 'The Grand Budapest Hotel', recently_viewed: true, length: 142, genre: 'Comedy-Drama')
wes.movies.create!(title: 'The Life Aqatic with Steve Zissou', recently_viewed: false, length: 118, genre: 'Comedy-Drama')
wes.movies.create!(title: 'The French Dispatch', recently_viewed: true, length: 118, genre: 'Comedy-Drama')

denis.movies.create!(title: 'Dune', recently_viewed: true, length: 156, genre: 'Sci-Fi')
denis.movies.create!(title: 'Blade Runner 2049', recently_viewed: true, length: 163, genre: 'Sci-Fi')

terry.movies.create!(title: 'The Man Who Killed Don Quixote', recently_viewed: true, length: 132, genre: 'Adventure-Comedy')
terry.movies.create!(title: '12 Monkeys', recently_viewed: false, length: 129, genre: 'Sci-Fi')
terry.movies.create!(title: 'Brazil', recently_viewed: false, length: 143, genre: 'Sci-Fi')

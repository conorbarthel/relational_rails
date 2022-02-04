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

Disc.destroy_all
Producer.destroy_all

innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
axiom = Producer.create!(name:'Axiom', number_of_athletes: 22, free_shipping: false)

discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
discraft.discs.create!(name: 'Heat', plastic: 'Big Z', speed: 7, available: true)
discraft.discs.create!(name: 'Nuke', plastic: 'ESP', speed: 13, available: true)
innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
innova.discs.create!(name: 'Destroyer', plastic: 'Star', speed: 12, available: true)
innova.discs.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, available: false)
axiom.discs.create!(name: 'Nomad', plastic: 'Neutron', speed: 2, available: false)
axiom.discs.create!(name: 'Crave', plastic: 'Plasma', speed: 6, available: true)
axiom.discs.create!(name: 'Defy', plastic: 'Plasma', speed: 11, available: true)


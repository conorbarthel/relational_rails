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

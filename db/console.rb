require_relative('../models/bounty_hunter')

bounty1 = BountyHunter.new({'name' => "Dog", 'bounty_value' => 1000000, 'homeworld' => "Earth", 'favourite_weapon' => "Taser"})
bounty2 = BountyHunter.new({'name' => "Claire", 'bounty_value' => 50000, 'homeworld' => "Wimbledonia", 'favourite_weapon' => "Racket"})


bounty1.save()
bounty2.save()
bounty2.delete
p BountyHunter.find()
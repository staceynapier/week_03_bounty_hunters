require_relative('../models/bounty_hunter')

bounty1 = BountyHunter.new({'name' => "Dog", 'bounty_value' => 1000000, 'homeworld' => "Earth", 'favourite_weapon' => "Taser"})

bounty1.save()
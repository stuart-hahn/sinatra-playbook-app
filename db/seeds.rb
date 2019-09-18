stuart = User.create(name: "Stuart", email: "stuart@stuart.com", password: "password")
ratchet = User.create(name: "Ratchet", email: "ratchet@ratchet.com", password: "password")

play1 = Play.create(formation: "SB Doubles", name: "PA Y-Corner Fork", setup: "Y - Motion Right, RB - Block", user_id: stuart.id)
play2 = Play.create(formation: "SB Doubles", name: "Fade Smash", setup: "RB - Block, Y - Streak, A - Motion Left", user_id: ratchet.id)
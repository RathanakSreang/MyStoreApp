# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Phnom Penh","Pursat","Banteay Meanchey",
  "Battambang","Kampong Cham","Kampong Speu",
  "Kampong Thom","Kampot","Kandal","Koh Kong",
  "Kep","Kratié","Mondulkiri","Oddar Meanchey",
  "Pailin","Preah Sihanouk","Preah Vihear",
  "Prey Veng","Ratanakiri","Siem Reap",
  "Stung Treng","Svay Rieng","Takéo",
  "Tbong Khmum","Kampong Chhnang"].each do |name|
    Province.create name:name
  end

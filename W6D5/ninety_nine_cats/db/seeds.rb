# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

blacky = Cat.create(birth_date: '2015/01/20', color: 'Black', name: 'Blacky', sex: 'M', description: 'I am a black colored cat')
blacky = Cat.create(birth_date: '1944/06/06', color: 'Tabby', name: 'Garfield', sex: 'M', description: 'I am a fat cat.')
blacky = Cat.create(birth_date: '2015/11/19', color: 'Calico', name: 'Petunia', sex: 'F', description: 'I am a fun cat.')
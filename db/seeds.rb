# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin

u1=User.create(nom:"a", prenom:"a",email:"a@a.com",password:"aaaaaa",telephone:"0341111111", adresse:"amboma", sexe:"homme",date_de_naissance:"1990/08/09", role:"etudiant")
u2=User.create(nom:"b", prenom:"b",email:"b@b.com",password:"bbbbbb",telephone:"0342222222", adresse:"tsiadana", sexe:"femme",date_de_naissance:"1991/08/09", role:"etudiant")
u3=User.create(nom:"c", prenom:"c",email:"c@c.com",password:"cccccc",telephone:"0343333333", adresse:"tsiadana", sexe:"femme",date_de_naissance:"1993/08/09", role:"admin")

e1=Etablissement.create(nom:"UPRIM",mail:"uprim@gmail.com",telephone:"0321111111", adress:"67 ha", description:"on apprends tout", category:"universite",longitude:-1.5, latitude:1.5)
e2=Etablissement.create(nom:"ISCAM",mail:"iscam@gmail.com",telephone:"032222222", adress:"akadifotsy", description:"on est les meilleurs", category:"universite",longitude:-1.5, latitude:1.5)
e3=Etablissement.create(nom:"LYCEE RANDRIANARISOA",mail:"randrianarisoa@gmail.com",telephone:"0331111111", adress:"ambatomitsangana", description:"sagesse et connaissance", category:"lycee",longitude:-1.5, latitude:1.5)

a1=AssociateUserEtab.new
a1.user=u1
a1.etablissement=e1
a1.save

f1 = Filiere.create(nom:"Gestion", description:"blablabla gestion")
f2 = Filiere.create(nom:"Informatique", description:"blablabla informatique")
f3 = Filiere.create(nom:"Paramed", description:"blablabla paramed")

fe1=AssociateFiliereEtab.new
fe1.filiere=Filiere.first
fe1.etablissement = Etablissement.first
fe1.save

n1=Niveau.create(niveau:"1", place:300)
n2=Niveau.create(niveau:"2", place:150)

ne = AssociateNiveauEtab.new
ne.etablissement = Etablissement.first
ne.niveau = Niveau.first
ne.save

e=Etablissement.find(2)
a=Article.new
a.titre="a"
a.message="a"
a.photo="a"
a.etablissement = e
a.save


ns1 = Niveausup.create(niveau:"1", nb_place: 200)
ns2 = Niveausup.create(niveau:"2", nb_place: 150)
ns3 = Niveausup.create(niveau:"3", nb_place: 100)

anf = AssociateNiveausupFiliere.new()
anf.niveausup = ns1
anf.filiere = f1
anf.save

=end
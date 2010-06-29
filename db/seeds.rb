# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Page.create( [
    { :id => 1,
      :name => "Home",
      :title => "Homepage",
      :body => "welkom op de site!"
    },
    { :id => 2,
      :name => "Diensten",
      :title => "Onze diensten",
      :body => "Dit is de hoofdtekst over de diensten",
      :parent_id => 1,
      :position => 1
    },
    { :name => "Schoorsteenvegen",
      :title => "Preventief schoorsteenvegen",
      :body => "Dit is de hoofdtekst",
      :parent_id => 2,
      :position => 1
    },
    { :name => "Hovenieren",
      :title => "Uw tuin kan beter",
      :body => "Dit is de hoofdtekst over de dienst",
      :parent_id => 2,
      :position => 2
    },
    { :name => "Schilderen",
      :title => "Schilderen van particulieren huizen (buiten)",
      :body => "Dit is de hoofdtekst over de dienst",
      :parent_id => 2,
      :position => 3
    },
    { :name => "Maan mijnen",
      :title => "Ongelovelijk veel mijnen daar",
      :body => "Dit is je kans om naar de maan te gaan!",
      :parent_id => 2,
      :position => 3,
      :draft => true
    },
    {
      :name => "Over ons",
      :title => "Over onze organisatie",
      :body => "Dit is de hoofdtekst",
      :url_name => "over",
      :parent_id => 1,
      :position => 2
    },
    { :name => "Contact",
      :title => "Over onze organisatie",
      :body => "Dit is de hoofdtekst",
      :url_name => "contact",
      :parent_id => 7,
      :position => 1
    },
    { :name => "Vacatures",
      :title => "Vacature overzicht",
      :body => "Dit is de hoofdtekst",
      :url_name => "vacatures",
      :parent_id => 7,
      :position => 2,
      :resource => "vacancies"
    },
    { :name => "Winteractie",
      :title => "De grote winteractie in 2015",
      :body => "Bla bla bla Bla bla bla Bla bla bla Bla bla bla Bla bla bla",
      :parent_id => 1,
      :position => 3,
      :hidden => true
    }
  ])
Vacancy.create( [
    {
      :name => "Blaatschaap",
      :body => "Blabla en nog meer bla."
    },
    {
      :name => "Lekker ding",
      :body => "Functiebeschrijving: lachen"
    },
    {
      :name => "Sales manager",
      :body => "Sell the damn thing."
    }
  ])
User.create( [
    {
      :email_address => "developers@brightin.nl",
      :password => "blabla"
    }
  ])
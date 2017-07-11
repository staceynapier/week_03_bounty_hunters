require('pg')
require('pry')

class BountyHunter

  attr_reader :id
  attr_accessor :name, :bounty_value, :homeworld, :favourite_weapon 

  def initialize(bounty_details)
    @name = bounty_details['name']
    @bounty_value = bounty_details['bounty_value'].to_i
    @homeworld = bounty_details['homeworld']
    @favourite_weapon = bounty_details['favourite_weapon']
    @id = bounty_details['id'].to_i if bounty_details['id']
  end

  def save
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )
    sql = "INSERT INTO bounty_hunter (name, bounty_value, homeworld, favourite_weapon) VALUES ('#{@name}', '#{@bounty_value}', '#{@homeworld}', '#{@favourite_weapon}') RETURNING id;"
    @id = db.exec(sql)[0]["id"].to_i
    db.close
  end

  def update
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )
    sql = "UPDATE bounty_hunter SET (name, bounty_value, homeworld, favourite_weapon) = ('#{@name}', '#{@bounty_value}', '#{@homeworld}', '#{@favourite_weapon}') WHERE id = #{@id};"
    db.exec(sql)
    db.close
  end

  def delete
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )
    sql = "DELETE FROM bounty_hunter WHERE id = #{id};"
    db.exec(sql)
    db.close
  end
#Implement a find method that returns one instance of your class (do you have to use a map method? Hmm.)
  def self.find
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )
    sql = "SELECT * FROM bounty_hunter;"
    bounties = db.exec(sql)
    db.close
    return bounties.map { |bounty| BountyHunter.new(bounty) } 
  end


end



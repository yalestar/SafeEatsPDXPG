require 'mongo'
include Mongo

db = MongoClient.new().db('yjk')

coll = db.collection('restaurants')

coll.find.each { |row|
 name = row['name']
 street = row['street']
 city = row['city']
 county = row['county']
 zipcode = row['zip']
 site_id = row['site_id']
 lon = row['loc'][0]
 lat = row['loc'][1]

 r = Restaurant.new(
 	name: name,
 	street: street,
 	city: city,
 	county: county,
 	zipcode: zipcode,
 	site_id: site_id,
 	lon: lon,
 	lat: lat
 	)

 r.save!
}

# update_sql = %Q|
# 	UPDATE restaurants SET lonlat = ST_GeogFromText('SRID=4326;POINT(' || lon || ' ' || lat || ')');
# |
# ActiveRecord::Connection.execute(update_sql)
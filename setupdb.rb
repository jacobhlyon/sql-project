require 'pry'
require "sqlite3"
require 'csv'


#above will create the Database



	
db = SQLite3::Database.new('daily_show.db')

		sql = <<-SQL
			CREATE TABLE IF NOT EXISTS shows (
				id INTEGER PRIMARY KEY,
				year INTEGER,
				show_date TEXT
				)
		SQL


db.execute(sql)

#below is the table for guests - we were still trying to get the code to work
	# 	sql = <<-SQL 
	# 		CREATE TABLE IF NOT EXISTS guests (
	# 			id INTEGER PRIMARY KEY,
	# 			name TEXT,
	# 			occupation TEXT,
	# 			guest_group TEXT,
	# 			)
	# 	SQL
	# db.execute(sql)


# below is our join table to link the shows and guests
	# 	sql = <<-SQL 
	# 		CREATE TABLE IF NOT EXISTS shows_guests (
	# 			id INTEGER PRIMARY KEY
	# 			show_id INTEGER,
	# 			guest_id INTEGER
	# 			)
	# 	SQL
	# db.execute(sql)




daily_show_guests = CSV.read('daily_show_guests.csv')

guests_array = Array.new
shows_array = Array.new
shows_guests_array = Array.new

CSV.foreach('daily_show_guests.csv') do |row|
	shows_array << [row[0].to_i, row[2]] 
	guests_array << [row[4], row[1], row[3]]
end

#we were still trying to get this to work to insert the data into the table
	shows_array.each do |index0, index1|
		db.execute('INSERT INTO shows (year, show_date) VALUES (?, ?)')
	end

puts db.execute('SELECT * FROM shows')




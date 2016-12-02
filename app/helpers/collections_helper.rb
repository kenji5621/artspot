module CollectionsHelper
	def xls_to_record(collection , url)
	  	require 'rubygems'
	  	require 'spreadsheet'
	  	if File.exists?(url)
		  	book = Spreadsheet.open(url)
		  	sheet1 = book.worksheet(0) # can use an index or worksheet name
			sheet1.each do |row|
		  	break if row[0].nil? # if first cell empty
		  	collection.information.create(maintitle: row[0],
		  		subtitle: 		row[1],
				year: 			row[2],
				medium: 		row[3],
				duration: 		row[4],
				objectnumber:   row[5],
				production: 	row[6],	
				department: 	row[7],
				publisher: 		row[8],
				printer: 		row[9],
				edition: 		row[10],
				copyright: 		row[11],
				portfolio: 		row[12],
				architectural: 	row[13],
				dimentions: 	row[14],
				credit: 		row[15],
				mtype: 			row[16],
				image: 			row[17])
			end
		end
	end
end

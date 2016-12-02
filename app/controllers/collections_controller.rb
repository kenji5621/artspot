class CollectionsController < ApplicationController
  include CollectionsHelper

  def index
  	@collection_search = Collection.ransack(params[:q])
  	@filtered_collections = @collection_search.result(distinct:true).includes(:information)
  end
  def show
  end
  def new
  end
  def create
  	# save xls data 

	#get files list sent by request
	if !params[:files_list_xls].nil?
  		files_list_xls = ActiveSupport::JSON.decode(params[:files_list_xls])
  	end
  	if !params[:files_list_pic].nil?
  		files_list_pic = ActiveSupport::JSON.decode(params[:files_list_pic])
  	end

  	#create new collection 
  	collection = Collection.create(name: params[:name])

	upload_path = "#{Rails.root}/public/uploads/collection/" + collection.id.to_s
	root_path   = "#{Rails.root}/"
	
	#make collection directory if doesn't exist
	if !Dir.exists?("#{Rails.root}/public/uploads/collection")	
		Dir.mkdir("#{Rails.root}/public/uploads/collection")
	end
  	if !Dir.exists?(upload_path)
	    Dir.mkdir(upload_path)
	    Dir.mkdir(upload_path + '/pic')
	    Dir.mkdir(upload_path + '/xls')
	end

  	#rearrnage upload files ,sepearte by their type

  	#first , excel file
  	files_list_xls.each do |xls|

	  	File.rename( root_path + xls, upload_path + '/xls/' + File.basename(xls))  	
	  	#convert xlsfile  to database by using helper function
	  	xls_to_record(collection , upload_path + '/xls/' + File.basename(xls))

	end

	#second , image folder
	files_list_pic.each do |pic|

	  	File.rename( root_path + pic, upload_path + '/pic/' + File.basename(pic))  	

	end

	# search engine
	@collection_search = Collection.ransack(params[:q])
  	@filtered_collections = @collection_search.result.includes(:information)

  	render 'index'
  end
  def b_upload
  end
  def m_upload
  end 
  def upload_xls 
  	  upload_path = "#{Rails.root}/public/uploads/xls"
      uploaded_pics = params[:file] # Take the files which are sent by HTTP POST request.

	  uploaded_pics.each do |pic|
	    if !Dir.exists?(upload_path)
	    	Dir.mkdir(upload_path)
	    end

	    File.open(Rails.root.join('public', 'uploads' ,pic[1].original_filename), 'wb') do |file|
	      file.write(pic[1].read)
	      File.rename(file, 'public/uploads/xls/' + pic[1].original_filename)
	    end
	  end
	  files_list = Dir['public/uploads/xls/*'].to_json #get a list of all files in the {public/uploads} directory and make a JSON to pass to the server
	  render json: { message: 'You have successfully uploded your images.', files_list_xls: files_list } #return a JSON object amd success message if uploading is successful
  end
  def upload_pic 
      upload_path = "#{Rails.root}/public/uploads/pic"
      uploaded_pics = params[:file] # Take the files which are sent by HTTP POST request.

	  uploaded_pics.each do |pic|
	    if !Dir.exists?(upload_path)
	    	Dir.mkdir(upload_path)
	    end

	    File.open(Rails.root.join('public', 'uploads', pic[1].original_filename), 'wb') do |file|
	      file.write(pic[1].read)
	      File.rename(file, 'public/uploads/pic/' +  pic[1].original_filename)
	    end
	  end
	  files_list = Dir['public/uploads/pic/*'].to_json #get a list of all files in the {public/uploads} directory and make a JSON to pass to the server
	  render json: { message: 'You have successfully uploded your images.', files_list_pic: files_list } #return a JSON object amd success message if uploading is successful
  end
  # get picture by collection id
  def get_pic
  	collection_id = params[:id]
  	@pic = Pic.find("collection_id")
  end
end

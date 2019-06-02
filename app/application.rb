class Application

require 'pry'

require_relative "./item.rb"
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env) 
    
if req.path.match(/items/)
 
 
      item_name = req.path.split("/items/").last 
      
      item_names = @@items.collect{|item| item.name}
      
      if item_names.include?(item_name) 
      
      resp.write @@items.find{|item| item.name == item_name}.price 
       
      resp.status = 200 
   
      else 
      
      resp.status = 400 
  
      resp.write "Item not found"
    
      end 

else 
      
      resp.status = 404 
      resp.write "Route not found"
    
end
 
    resp.finish
  end
end
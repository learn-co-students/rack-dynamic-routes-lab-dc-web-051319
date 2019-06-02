class Application
  @@items = [Item.new("Cucumber", 1.75), Item.new("Squash", 3.00)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      items = req.path.split("/items/").last
      if item = @@items.find do |i|
          i.name == items
          end
        resp.write item.price
      else
        resp.status = 400
        resp.write  "Item not found"
    end
   else
     resp.status = 404
     resp.write  "Route not found"
   end
   resp.finish
 end



end

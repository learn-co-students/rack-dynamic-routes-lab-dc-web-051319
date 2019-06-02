# frozen_string_literal: true

class Application
  #   @@item = [Item.new('item1', 10), Item.new('item2', 20)]
  @@item = [Item.new('Figs', 3.42), Item.new('Pears', 0.99)]

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      search_item = req.path.split('/items/').last
      selected_item = @@item.find do |item|
        item.name == search_item
      end

      if selected_item
        resp.write selected_item.price
      else
        resp.status = 400
        resp.write 'Item not found'
      end
    else
      resp.status = 404
      resp.write 'Route not found'
    end

    resp.finish
  end
end

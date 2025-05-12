class Product
  class << self
    def products
      @products ||= [
        { id: 1, name: 'Producto 1' },
        { id: 2, name: 'Producto 2' }
      ]
    end

    def all
      products
    end

    def create(name)
      products << { id: next_id, name: name }
    end

    def find(id)
      products.find { |product| product[:id] == id }
    end

    def next_id
      products.empty? ? 1 : products.map { |p| p[:id] }.max + 1
    end
  end
end

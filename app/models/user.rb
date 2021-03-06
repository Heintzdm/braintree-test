class User < ActiveRecord::Base
  has_many :selecteditems
  has_many :products, through: :selecteditems


  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email

  has_secure_password

  def cart_total
    cost = self.products.inject(0) do |total, item|
          total + item.price
    end

    return cost
  end

  def build_cart
    cart = self.products.uniq
    cart.each do |item|
        item.multiplier = self.products.where(id: item).length
    end
    return cart
  end


end

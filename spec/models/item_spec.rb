require 'rails_helper'

describe Item do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a unique title" do
        Item.create(title: "Mask", description: "Something to put on your face.", price: 49.95, status: 1)
        item = Item.new(title: "Mask", description: "Something to put on your face.", price: 49.95, status: 1)
        expect(item).to be_invalid
      end

      it "is invalid without a description" do
        item = Item.new(title: "Mask", price: 49.95, status: 1)
        expect(item).to be_invalid
      end

      it "is invalid without a price" do
        item = Item.new(title: "Mask", description: "Something to put on your face.", status: 1)
        expect(item).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, description, and price" do
        item = Item.new(title: "Mask", description: "Something to put on your face.", price: 49.95, status: 1)
        expect(item).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many order_items" do
      item = Item.new(title: "Mask", description: "Something to put on your face.", price: 49.95, status: 1)
      expect(item).to respond_to(:order_items)
    end

    it "has many orders" do
      item = Item.new(title: "Mask", description: "Something to put on your face.", price: 49.95, status: 1)
      expect(item).to respond_to(:orders)
    end

    it "has many item_categories" do
      item = Item.new(title: "Mask", description: "Something to put on your face.", price: 49.95, status: 1)
      expect(item).to respond_to(:item_categories)
    end

    it "has many categories" do
      item = Item.new(title: "Mask", description: "Something to put on your face.", price: 49.95, status: 1)
      expect(item).to respond_to(:categories)
    end
  end
end

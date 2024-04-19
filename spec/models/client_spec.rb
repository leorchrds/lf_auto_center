require 'rails_helper'

RSpec.describe Client, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      client = Client.new(name: "John Doe", phone: "1234567890")
      expect(client).to be_valid
    end

    it "is not valid without a name" do
      client = Client.new(phone: "1234567890")
      expect(client).not_to be_valid
      expect(client.errors[:name]).to include("não pode ficar em branco")
    end

    it "is not valid without a phone" do
      client = Client.new(name: "John Doe")
      expect(client).not_to be_valid
      expect(client.errors[:phone]).to include("não pode ficar em branco")
    end
  end
end

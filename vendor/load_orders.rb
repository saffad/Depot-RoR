Order.transaction do
  (1..100).each do |i|
    Order.create(name:"Customer #{i}", address: "#{i} Main street",
    email: "customer-#{i}@city.ac.uk", pay_type: "Debit Card")
  end
end
#this is a script to add 100 fake orders to test
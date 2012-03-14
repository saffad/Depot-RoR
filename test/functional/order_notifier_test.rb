require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "SOI Order Confirmation", mail.subject
    assert_equal ["dave@city.ac.uk"], mail.to
    assert_equal ["saffad@gmail.com"], mail.from
    assert_match /1 x Software Engineering/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "SOI Order Shipped", mail.subject
    assert_equal ["dave@city.ac.uk"], mail.to
    assert_equal ["saffad@gmail.com"], mail.from
    assert_match /1 x Software Engineering/, mail.body.encoded
  end

end

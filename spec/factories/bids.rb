FactoryGirl.define do
  factory :bid, class: 'Bids' do
    event_id 1
    user_id 1
    bid 1
    lowest_price 1
    saved_bid 1
    event_title "MyString"
  end
end

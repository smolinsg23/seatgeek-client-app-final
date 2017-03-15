namespace :rufus do
  desc "TODO"
  task price_match: :environment do
    PriceMatch.perform
  end

end

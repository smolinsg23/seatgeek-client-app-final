namespace :rufus do
  desc "TODO"
  task price_match: :environment do
    PriceMatchJob.run
  end

end

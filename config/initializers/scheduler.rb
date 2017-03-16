# unless defined?(Rails::Console) || File.split($0).last == 'rake'
#   s = Rufus::Scheduler.singleton
#   s.every '1m', :tag => 'main_process' do
#     print "hello"
#   PriceMatch.perform
#  end 
#     end

PriceMatchJob.run
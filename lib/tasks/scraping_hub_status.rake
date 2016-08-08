namespace :scraping_hub do
  desc "Scraping hub status"
  task :status => :environment do
    response = HTTParty.get('https://dash.scrapinghub.com/api/jobs/list.json?apikey=59b71433610042409cb275625fb75e7f&project=60963&state=running')
    UserMailer.send_status_mail(response).deliver
    puts "111111111111"
  end
end
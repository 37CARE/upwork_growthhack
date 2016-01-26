namespace :find do
  task freelancers: :environment do

    class Outdoor
      include Capybara::DSL

      def initialize
        Capybara.default_driver = :selenium
      end

      def find
        visit "https://www.upwork.com/"
        sleep 20
        # login here
        (1..5).each do |page|
          visit "https://www.upwork.com/o/profiles/browse/nss/80/hrs/1/?page=#{page}&q=capybara&rate=10-30"
          sleep 5
          all(".jsContactBtn").each do |contact|
            contact.click
            sleep 5
            all(".send-invite-btn")[0].click
            sleep 5
          end
        end
      end
    end

    Outdoor.new.find

  end
end
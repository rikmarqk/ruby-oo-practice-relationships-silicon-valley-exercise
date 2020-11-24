class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |venture_capitalist|
            venture_capitalist.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self    #THIS IS a KEY METHOD, CONNECTS W JOINER
        end
    end

    def portfolio
        portfolio_array = self.funding_rounds.map do |fr|
            fr.startup
        end
        portfolio_array.uniq
    end
    
    def biggest_investment
        largest_funding = 0
        return_funding = nil
        self.funding_rounds.find do |fr|
            if fr.investment > largest_funding
                largest_funding = fr.investment #200
                return_funding = fr
            end
        end
        return_funding

        # self.funding_rounds.max_by do |fr|
        #      fr.investment
        # end

    
    end

    def invested(domain)
        inv_total = 0
        self.funding_rounds.map do |fr|
            if fr.startup.domain == domain
                inv_total += fr.investment
            end
        end
        inv_total
    end

end

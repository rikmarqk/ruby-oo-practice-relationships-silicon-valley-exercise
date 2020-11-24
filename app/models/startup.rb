class Startup

    attr_reader :founder
    attr_accessor :name, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        Startup.all.find do | startup |
            startup.founder == founder_name
        end
    end

    def self.domains
        domains_array = Startup.all.map do | startup |
            startup.domain
        end
        domains_array.uniq
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        funding_round_array = FundingRound.all.select do | fundinground |
            fundinground.startup == self
        end
        funding_round_array.length
    end

    def funding_rounds
        funding_round_array = FundingRound.all.select do | fundinground |
            fundinground.startup == self
        end
    end

    def total_funds
        total = 0
        self.funding_rounds.each do |funding_round|
            total += funding_round.investment
        end
        total
    end

    def investors
        inv_array = []
        self.funding_rounds.each do | fr |
            if fr.startup == self
                inv_array << fr.venture_capitalist  
            end          
        end
        inv_array.uniq
    end

    def big_investors
        self.investors.select do |inv|
            VentureCapitalist.tres_commas_club.include?(inv)
        end
    end

    private
end

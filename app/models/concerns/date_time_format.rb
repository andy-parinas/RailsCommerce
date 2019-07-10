module DateTimeFormat
    extend ActiveSupport::Concern


    def self.convert_to_au_format(datetime, timezone)
        zone = ActiveSupport::TimeZone.new(timezone)
        datetime.in_time_zone(zone).strftime("%d/%m/%y %I:%M %p")
    end

end
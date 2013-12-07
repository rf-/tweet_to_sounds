module Freesound
  class Client
    def advanced_search(query)
      search(query, sounds_per_page: 10,
                    f: "duration:[0 TO 10]"
                    #s: "rating_desc"
      )
    end
  end
end

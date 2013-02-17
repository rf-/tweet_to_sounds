require "freesound"
require "tweet_to_sounds/freesound_ext"

require "tweet_to_sounds/version"
require "tweet_to_sounds/keyword_extractor"
require "tweet_to_sounds/sound_finder"

module TweetToSounds
  class << self
    def sounds_for_tweet(tweet)
      keywords = KeywordExtractor.new(tweet).keywords
      SoundFinder.new(keywords).urls
    end

    def freesound
      @freesound ||= Freesound::Client.new("f21ede7f1694428ab829e72f52e3d2df")
    end

    attr_writer :number_of_sounds

    def number_of_sounds
      @number_of_sounds ||= 5
    end
  end
end

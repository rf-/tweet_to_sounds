require "spec_helper"

describe TweetToSounds do
  describe ".sounds_for_tweet" do
    it "should return sound urls for a tweet" do
      tweet  = "Old technology, old procedures, old policies, old methods, " \
                 "or; Often produces"
      sounds = TweetToSounds.sounds_for_tweet(tweet)
      sounds.must_be_instance_of Array
    end
  end
end

module TweetToSounds
  class SoundFinder
    def initialize(keywords)
      @keywords = keywords
    end

    def urls
      sounds.map &:preview_hq_mp3
    end

    def sounds
      @sounds ||= begin
        sounds = pick_keywords(@keywords).flat_map do |keyword|
          pick_results TweetToSounds.freesound.advanced_search(keyword)
        end
        stable_sample sounds, TweetToSounds.number_of_sounds
      end
    end

    protected

    def pick_keywords(keywords)
      stable_sample keywords, 5
    end

    # TODO: be smarter
    def pick_results(sounds)
      stable_sample sounds, 3
    end

    def stable_sample(array, num_elements)
      result   = []
      num_left = num_elements
      length   = array.length

      array.each_with_index do |el, index|
        threshold = [1.0, (num_left.to_f / (length - index))].min
        if Kernel.rand <= threshold
          result << el
          num_left -= 1
        end
      end

      result
    end
  end
end

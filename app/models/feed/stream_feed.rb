class Feed
  class StreamFeed
    attr_reader :group, :id, :stream_feed

    def initialize(group, id)
      @group = group_name_for(group)
      @id = id
      @stream_feed = client.feed(group, id)
    end

    def activities
      ActivityList.new(self)
    end

    def follow(feed)
      stream_feed.follow(feed.group, feed.id)
    end

    def unfollow(feed)
      stream_feed.unfollow(feed.group, feed.id)
    end

    def stream_id
      "#{@group}:#{@id}"
    end

    private

    def group_name_for(group)
      if group.respond_to?(:to_h)
        # Extract the attributes to build the group name
        name, filter, type = group.to_h.values_at(:name, :filter, :type)
        # Convert aggregated feed to "aggr"
        type = type == :aggregated ? 'aggr' : nil
        # Build it to be `name_filter_type`
        [name, filter, type].compact.join('_')
      else
        group
      end
    end
  end
end

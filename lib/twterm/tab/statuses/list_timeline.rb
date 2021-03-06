require 'twterm/tab/statuses/abstract_statuses_tab'

module Twterm
  module Tab
    module Statuses
      class ListTimeline < AbstractStatusesTab
        include Dumpable

        attr_reader :list_id

        def initialize(app, client, list_id)
          super(app, client)

          @list_id = list_id

          self.title = 'Loading...'.freeze

          @auto_reloader = Scheduler.new(300) { reload }

          find_or_fetch_list(list_id).then do |list|
            self.title = list.full_name
            app.tab_manager.refresh_window

            reload.then do
              initially_loaded!
              scroller.move_to_top
            end
          end
        end

        def fetch
          client.list_timeline(list_id)
        end

        def close
          @auto_reloader.kill if @auto_reloader
          super
        end

        def ==(other)
          other.is_a?(self.class) && list_id == other.list_id
        end

        def dump
          list_id
        end
      end
    end
  end
end

require 'fog/core/collection'
require 'fog/openstack/models/network/lb_member'

module Fog
  module Network
    class OpenStack
      class LbMembers < Fog::Collection
        attribute :filters

        model Fog::Network::OpenStack::LbMember

        def initialize(attributes)
          self.filters ||= {}
          super
        end

        def all(filters = filters)
          self.filters = filters
          load(service.list_lb_members(filters).body['members'])
        end

        def get(member_id)
          if member = service.get_lb_member(member_id).body['member']
            new(member)
          end
        rescue Fog::Network::OpenStack::NotFound
          nil
        end
      end
    end
  end
end

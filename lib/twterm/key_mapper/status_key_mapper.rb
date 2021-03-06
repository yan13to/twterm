require 'twterm/key_mapper/abstract_key_mapper'

class Twterm::KeyMapper::StatusKeyMapper < Twterm::KeyMapper::AbstractKeyMapper
  DEFAULT_MAPPINGS = {
    compose: '^N',
    conversation: 'c',
    destroy: 'D',
    like: 'F',
    open_link: 'o',
    quote: 'Q',
    reply: 'r',
    retweet: 'R',
    user: 'U',
  }.freeze

  def self.category
    'status'.freeze
  end
end

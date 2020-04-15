require "yaml"
require "pry"

def load_library(path)
  emoticons = YAML.load_file(path)
  lookup = {}
  lookup[:get_meaning] = {}
  lookup[:get_emoticon] = {}

  emoticons.each do |word, pair|
    japanese = pair[1]
    american = pair[0]

    lookup[:get_meaning][japanese] = word
    lookup[:get_emoticon][american] = japanese
  end

  lookup
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end
module Brightcontent
  module TranslationHelper

    # http://en.wiktionary.org/wiki/nominative_case
    #
    # This implementation works fine for Germanic languages and it will fail
    # horribly at Slavic languages or Arabic. Support for true declensions
    # could be added later though.
    #
    # This method exists because:
    # - we don't want to abuse #human(count: 2) because that should return
    #   something like "2 Users" and not just "Users". It's not meant to say
    #   things like: "These are users"
    # - we want to avoid feeding the current locale to #pluralize the whole time
    #
    # nominative_plural("thing") => "things"
    # nominative_plural(User) => "users"
    # or if I18n.locale == :nl
    #   nominative_plural(User) => "gebruikers"
    #   nominative_plural("thing") => "dingen"
    def nominative_plural(thing)
      if thing.respond_to? :model_name
        nominative_plural(thing.model_name.human)
      else
        I18n.t "#{thing}.title", default: thing.to_s.pluralize(I18n.locale)
      end
    end

    def nominative_singular(thing)
      if thing.respond_to? :model_name
        nominative_singular(thing.model_name.human)
      else
        I18n.t "#{thing}.title", default: thing.to_s.singularize(I18n.locale)
      end
    end

  end
end

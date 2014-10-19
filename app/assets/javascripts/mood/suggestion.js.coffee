Cravings.Mood.Suggestion = 

  init: ->
    @setEvents()

  select: ->

  nextChoice: ->
    $('.js-mood-selections').submit()

  choose: ->
    $('.js-mood-suggestion').submit()

  setEvents: ->
    $('.js-other-choice').on('click', @nextChoice)
    $('.js-select-choice').on('click', @choose)

  displayChoices: ->
    if Cravings.Mood.Tags.length >= 2
      $('#js-left-choice').html(Cravings.Mood.Tags.pop().name)
      $('#js-right-choice').html(Cravings.Mood.Tags.pop().name)
    else
      @getTags()

  getTags: ->
    $.ajax
      type: "GET"
      url: "/mood/selection"
      dataType: "json"

      success: (data) ->
        if data.length == 0
          @nextChoice()
        else
          Cravings.Mood.Tags = data
          console.log data
          Cravings.Mood.Selection.displayChoices()
        return
      error: (data) ->
        console.log 1


$ ->
  Cravings.Mood.Suggestion.init()

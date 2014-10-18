Cravings.Mood.Selection = 

  init: ->
    @displayChoices()
    @selections = []
    @setEvents()

  select: ->
    selection = $(this).find('.js-choice-name').html()
    Cravings.Mood.Selection.selections.push(selection) if selection
    console.log Cravings.Mood.Selection.selections
    Cravings.Mood.Selection.displayChoices()

  setEvents: ->
    $('.js-choice').on('click', @select)

  displayChoices: ->
    if Cravings.Mood.Tags.length >= 2
      $('#js-left-choice').html(Cravings.Mood.Tags.pop())
      $('#js-right-choice').html(Cravings.Mood.Tags.pop())
    else
      @getTags()

  getTags: ->
    $.ajax
      type: "GET"
      url: "/mood/selection"
      dataType: "json"

      success: (data) ->
        Cravings.Mood.Tags = data
        Cravings.Mood.Selection.displayChoices()
        return
      error: (data) ->
        console.log 1

$ ->
  Cravings.Mood.Selection.init()

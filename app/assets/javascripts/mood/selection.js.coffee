Cravings.Mood.Selection = 

  init: ->
    @displayChoices()
    @selections = []
    @setEvents()

  select: ->
    selection = $(this).find('.js-choice-name').html()
    Cravings.Mood.Selection.selections.push(selection) if selection
    if Cravings.Mood.Selection.selections.length >= 3
      Cravings.Mood.Selection.suggest()
    else
      Cravings.Mood.Selection.displayChoices()

  setEvents: ->
    $('.js-choice').on('click', @select)

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
          Cravings.Mood.Selection.suggest()
        else
          Cravings.Mood.Tags = data
          Cravings.Mood.Selection.displayChoices()
        return
      error: (data) ->
        console.log 1

  suggest: ->
    form = $('<form action="/mood/suggestion"></form>')
    $.each Cravings.Mood.Selection.selections, (i, obj)=>
      form.append('<input type="hidden" name="selections[]" value="'+obj+'" />')
    $('body').append(form)
    form.submit();

$ ->
  Cravings.Mood.Selection.init()

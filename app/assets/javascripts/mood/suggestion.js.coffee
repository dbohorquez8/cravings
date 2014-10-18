Cravings.Mood.Suggestion = 

  init: ->
    @embedSelectionsForm()
    @setEvents()

  embedSelectionsForm: ->
    form = $('<form class="js-mood-selections" action="/mood/suggestion"></form>')
    $.each Cravings.Mood.Selections, (i, obj)=>
      form.append('<input type="hidden" name="selections[]" value="'+obj+'" />')
    $('body').append(form)



  select: ->

  nextChoice: ->
    $('.js-mood-selections').submit()

  setEvents: ->
    $('.js-other-choice').on('click', @nextChoice)
    $('.js-select-choice').on('click', @nextChoice)

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
        if data == []
          Cravings.Mood.Selection.suggest()
        else
          Cravings.Mood.Tags = data
          console.log data
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
  Cravings.Mood.Suggestion.init()

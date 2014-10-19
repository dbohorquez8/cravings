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
      left_choice = Cravings.Mood.Tags.pop().name
      right_choice = Cravings.Mood.Tags.pop().name
      $('#js-left-choice').find('.js-choice-name').html(left_choice)
      $('#js-right-choice').find('.js-choice-name').html(right_choice)

      $('#js-left-choice').find('.icon').attr('class', '').addClass("icon icon--#{left_choice}")
      $('#js-right-choice').find('.icon').attr('class', '').addClass("icon icon--#{right_choice}")
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
    form = $('<form action="/mood/suggestion" method="post"></form>')
    form.append('<input name="authenticity_token" type="hidden" value="'+FormAuthenticityToken+'" />')
    $.each Cravings.Mood.Selection.selections, (i, obj)=>
      form.append('<input type="hidden" name="selections[]" value="'+obj+'" />')
    $('body').append(form)
    form.submit();

$ ->
  Cravings.Mood.Selection.init()

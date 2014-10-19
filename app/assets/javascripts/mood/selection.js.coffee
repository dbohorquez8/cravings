Cravings.Mood.Selection =

  init: ->
    @displayChoices()
    @selections = []
    @setEvents()
    $('.js-hidden').hide()

  select: ->
    selection = $(this).find('.js-choice-name').html()
    Cravings.Mood.Selection.addSelectionToList(selection) if selection
    if Cravings.Mood.Selection.selections.length >= Cravings.Mood.maxSelections
      Cravings.Mood.Selection.suggest()
    else
      Cravings.Mood.Selection.displayChoices()

  setEvents: ->
    $('.js-choice').on('click', @select)
    $('.js-selected-tags').find('ul.list--tags').on('click', 'li', @remove)

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

  suggest: ->
    form = $('<form action="/mood/suggestion" method="post"></form>')
    form.append('<input name="authenticity_token" type="hidden" value="'+FormAuthenticityToken+'" />')
    $.each Cravings.Mood.Selection.selections, (i, obj)=>
      form.append('<input type="hidden" name="selections[]" value="'+obj+'" />')
    $('body').append(form)
    form.submit()

  addSelectionToList: (selection) ->
    Cravings.Mood.Selection.selections.push(selection)
    if selection
      $('.js-selected-tags').show()
      $('.js-selected-tags').find('.list--tags').append("<li><span>#{selection}</span> <i class='icon icon--cancel-circle'></i></li>")

    return

  remove: (el) ->
    selection = $(el).html()
    @remove()
    Cravings.Mood.Selection.selections.splice(Cravings.Mood.Selection.selections.indexOf(selection), 1)

$ ->
  Cravings.Mood.Selection.init()

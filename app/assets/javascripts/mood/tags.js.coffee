'use strict'

Cravings.mood = {}

Cravings.mood.getTags = ->
  $.ajax
    type: "GET"
    url: "/mood/tags"
    dataType: "JSON"

    success: (data) ->
      console.log data
      return

Cravings.mood.tags = Cravings.mood.getTags
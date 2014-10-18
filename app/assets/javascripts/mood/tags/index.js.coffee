Cravings.Mood.getTags = ->
  $.ajax
    type: "GET"
    url: "/mood/tags"
    dataType: "json"

    success: (data) ->
      console.log data
      return
    error: (data) ->
      console.log 1

Cravings.Mood.Tags = Cravings.Mood.getTags()
console.log Cravings.Mood.Tags
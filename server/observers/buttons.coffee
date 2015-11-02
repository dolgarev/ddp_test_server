Meteor.startup ->
  do ->
    handler = (num) ->
      total= Events.find
        'details.number': num
      .count()

      return if total % 5 isnt 0

      Actions.insert
        event: 'action:show_alert'
        details:
          message: 'Hello World!'
          number: num
        is_show: false

    initializing = true
    Events.find().observeChanges
      added: (id, fields) ->
        handler fields.details.number if fields.details?.number? and not initializing
    initializing = false
